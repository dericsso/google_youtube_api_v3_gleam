//// Execute [`Request`](./request.html#Request) values with
//// [`gleam_httpc`](https://hex.pm/packages/gleam_httpc), bindings to
//// Erlang's built-in `httpc` client.
////
//// Erlang target only. This module is a worked-example transport over
//// the Sans-IO core, maintained as source (not generated): render a
//// `Request` purely with [`to_url`](#to_url) for logging, convert it
//// with [`to_httpc_request`](#to_httpc_request), send it with
//// [`send`](#send), then decode the body with `request.parse_response`
//// and a generated `decoder()`.
////
//// ```gleam
//// import google_youtube_api_v3/httpc
//// import google_youtube_api_v3/request
//// import youtube/api/videos
//// import youtube/video_list_response
////
//// pub fn popular(api_key: String) {
////   let req =
////     videos.list(["snippet"])
////     |> videos.list_with_chart(videos.ListChartMostPopular)
////     |> videos.list_with_max_results(10)
////     |> videos.list_request
////   use response <- result.try(
////     httpc.send(req, request.ApiKey(api_key))
////     |> result.map_error(fn(_) { Nil }),
////   )
////   request.parse_response(response.status, response.body, video_list_response.decoder())
////   |> result.map_error(fn(_) { Nil })
//// }
//// ```

import gleam/http
import gleam/http/request as http_request
import gleam/http/response as http_response
import gleam/httpc
import gleam/list
import gleam/option.{Some}
import gleam/string
import google_youtube_api_v3/request.{type Credentials, type Request}

const api_host = "www.googleapis.com"

/// An executed exchange: status code, headers, and body as a string.
/// Feed `status` and `body` into `request.parse_response`.
pub type Response {
  Response(status: Int, headers: List(#(String, String)), body: String)
}

/// What can go wrong outside the API itself. API-level failures come
/// back as `Ok(Response)` with a non-2xx status; decode those with
/// `request.parse_response`.
pub type HttpError {
  TransportFailed(httpc.HttpError)
}

/// Render a request's full URL for display and logging: root + path +
/// encoded query string. Pure: test request builders through this
/// without any I/O. The transport itself goes through
/// [`to_httpc_request`](#to_httpc_request), which lets `gleam_http`
/// own the encoding.
pub fn to_url(request: Request) -> String {
  case request.query {
    [] -> "https://" <> api_host <> "/" <> request.path
    query ->
      "https://"
      <> api_host
      <> "/"
      <> request.path
      <> "?"
      <> string.join(
        list.map(query, fn(pair) {
          percent_encode(pair.0) <> "=" <> percent_encode(pair.1)
        }),
        with: "&",
      )
  }
}

/// Convert a Sans-IO request into a `gleam_http` request record ready
/// for `httpc.send`. Pure.
pub fn to_httpc_request(request: Request) -> http_request.Request(String) {
  http_request.new()
  |> http_request.set_method(request.method)
  |> http_request.set_scheme(http.Https)
  |> http_request.set_host(api_host)
  |> http_request.set_path("/" <> request.path)
  |> http_request.set_query(request.query)
  |> with_headers(request.headers)
  |> http_request.set_body(case request.body {
    Some(body) -> body
    _ -> ""
  })
}

fn with_headers(
  req: http_request.Request(String),
  headers: List(#(String, String)),
) -> http_request.Request(String) {
  list.fold(headers, req, fn(req, header) {
    http_request.prepend_header(req, header.0, header.1)
  })
}

/// Send one request with `httpc` and collect the response.
/// Only JSON bodies are supported; media uploads need a
/// resumable-upload client instead.
pub fn send(
  request: Request,
  credentials: Credentials,
) -> Result(Response, HttpError) {
  let request = request.authorize(request, credentials)
  case httpc.send(to_httpc_request(request)) {
    Ok(response) -> Ok(from_httpc_response(response))
    Error(reason) -> Error(TransportFailed(reason))
  }
}

fn from_httpc_response(response: http_response.Response(String)) -> Response {
  Response(
    status: response.status,
    headers: response.headers,
    body: response.body,
  )
}

fn percent_encode(value: String) -> String {
  // The values codegen produces (ids, tokens, part names) are already
  // URL-safe; encode just the reserved few for display URLs.
  value
  |> string.replace(" ", "%20")
  |> string.replace("&", "%26")
  |> string.replace("=", "%3D")
  |> string.replace("?", "%3F")
  |> string.replace("#", "%23")
  |> string.replace("+", "%2B")
}
