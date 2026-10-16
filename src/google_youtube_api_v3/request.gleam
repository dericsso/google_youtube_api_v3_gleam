//// Sans-IO HTTP runtime for the generated YouTube API bindings.
////
//// This module never performs I/O. It describes requests as data
//// ([`Request`](#Request)), applies credentials to them, and parses
//// responses back into the generated types. Executing a request against
//// a real transport (see `google_youtube_api_v3/httpc` for an Erlang
//// example) is the caller's job.

import gleam/dict
import gleam/dynamic/decode
import gleam/http.{type Method}
import gleam/json
import gleam/option.{type Option, None, Some}

/// A fully-described API call. Build one with the generated
/// `*_request` functions (e.g. `youtube/api/videos.list_request`),
/// attach credentials with [`authorize`](#authorize), then execute it
/// with your own HTTP client.
///
/// The verb is [`gleam/http`'s `Method`](https://hexdocs.pm/gleam_http/gleam/http.html#Method)
/// so requests plug straight into ecosystem clients; only
/// `Get`/`Post`/`Put`/`Delete` are ever generated.
pub type Request {
  Request(
    method: Method,
    path: String,
    query: List(#(String, String)),
    headers: List(#(String, String)),
    scopes: List(String),
    body: Option(String),
  )
}

/// How a request authenticates.
pub type Credentials {
  /// A public API key, sent as the `key` query parameter.
  ApiKey(String)
  /// An OAuth 2.0 access token, sent as a bearer `Authorization` header.
  OAuthToken(String)
}

/// Attach credentials to a request. An API key is appended to the query
/// parameters; an OAuth token becomes an `Authorization` header.
pub fn authorize(request: Request, credentials: Credentials) -> Request {
  case credentials {
    ApiKey(key) -> Request(..request, query: [#("key", key), ..request.query])
    OAuthToken(token) ->
      Request(..request, headers: [
        #("Authorization", "Bearer " <> token),
        ..request.headers
      ])
  }
}

/// An API-level failure: either the transport answered with a non-2xx
/// status carrying Google's standard error body, or the body did not
/// decode with the supplied decoder.
pub type RequestError {
  HttpError(ApiError)
  DecodeError(json.DecodeError)
}

/// The `error` object inside a non-2xx YouTube API response.
pub type ApiError {
  ApiError(status: Int, code: Int, message: String)
}

/// Parse a completed HTTP exchange. Successful (2xx) bodies decode with
/// the generated `decoder()`; anything else decodes the standard error
/// object. Transport-level failures never reach this function — they are
/// your HTTP client's errors, not the API's.
pub fn parse_response(
  status: Int,
  body: String,
  decoder: decode.Decoder(a),
) -> Result(a, RequestError) {
  case status >= 200 && status < 300 {
    True ->
      case json.parse(body, decoder) {
        Ok(value) -> Ok(value)
        Error(reason) -> Error(DecodeError(reason))
      }
    False ->
      case json.parse(body, api_error_decoder(status)) {
        Ok(error) -> Error(HttpError(error))
        Error(reason) -> Error(DecodeError(reason))
      }
  }
}

fn api_error_decoder(transport_status: Int) -> decode.Decoder(ApiError) {
  use error <- decode.field("error", {
    use code <- decode.field("code", decode.int)
    use message <- decode.field("message", decode.string)
    decode.success(ApiError(status: 0, code:, message:))
  })
  // The transport status is more reliable than the body's `code`,
  // which the API sometimes omits or generalizes.
  decode.success(ApiError(..error, status: transport_status))
}

/// Decode just the error object of a failure body, without a status code.
pub fn error_message(body: String) -> Result(String, json.DecodeError) {
  let decoder = {
    use message <- decode.field("error", {
      use message <- decode.field("message", decode.string)
      decode.success(message)
    })
    decode.success(message)
  }
  json.parse(body, decoder)
}

/// Extract the OAuth scopes a request needs, for display on consent screens
/// or for requesting tokens up front.
pub fn required_scopes(request: Request) -> List(String) {
  request.scopes
}

/// Look up the first value of a query parameter.
pub fn query_param(request: Request, name: String) -> Option(String) {
  request.query
  |> dict.from_list
  |> dict.get(name)
  |> option_from_result
}

fn option_from_result(result: Result(a, e)) -> Option(a) {
  case result {
    Ok(value) -> Some(value)
    Error(_) -> None
  }
}
