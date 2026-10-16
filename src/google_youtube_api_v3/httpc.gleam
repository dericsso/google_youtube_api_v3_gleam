//// Execute [`Request`](./request.html#Request) values with Erlang's
//// built-in `httpc` client.
////
//// Erlang target only. This module is a handwritten example transport
//// over the Sans-IO core: render the URL purely with [`to_url`](#to_url),
//// send it with [`send`](#send), then decode the body with
//// `request.parse_response` and a generated `decoder()`.
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

import gleam/http.{Delete, Get, Post, Put}
import gleam/list
import gleam/option.{None, Some}
import gleam/result
import gleam/string
import google_youtube_api_v3/request.{type Credentials, type Request}

const api_root = "https://www.googleapis.com/"

/// An executed exchange: status code, headers, and body as a string.
/// Feed `status` and `body` into `request.parse_response`.
pub type Response {
  Response(status: Int, headers: List(#(String, String)), body: String)
}

/// What can go wrong outside the API itself. API-level failures come
/// back as `Ok(Response)` with a non-2xx status; decode those with
/// `request.parse_response`.
pub type HttpError {
  TransportFailed(String)
}

/// Render a request's full URL: root + path + encoded query string.
/// Pure: test your request builders through this without any I/O.
pub fn to_url(request: Request) -> String {
  case request.query {
    [] -> api_root <> request.path
    query ->
      api_root
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

/// Send one request with `httpc` and collect the response.
/// Only JSON bodies are supported; media uploads need a
/// resumable-upload client instead.
pub fn send(
  request: Request,
  credentials: Credentials,
) -> Result(Response, HttpError) {
  let request = request.authorize(request, credentials)
  use #(verb, content_type, body) <- result.try(method_and_body(request))
  case ffi_request(verb, to_url(request), request.headers, content_type, body) {
    Ok(#(status, headers, raw_body)) ->
      Ok(Response(status:, headers:, body: raw_body))
    Error(reason) -> Error(TransportFailed(reason))
  }
}

/// Split a request into its httpc verb, content type, and body.
/// Generated builders only ever produce get/post/put/delete; anything
/// else is a caller-constructed `Request` this transport won't send.
fn method_and_body(
  request: Request,
) -> Result(#(String, String, String), HttpError) {
  case request.method, request.body {
    Get, _ -> Ok(#("get", "", ""))
    Delete, _ -> Ok(#("delete", "", ""))
    Post, None -> Ok(#("post", "application/json", ""))
    Put, None -> Ok(#("put", "application/json", ""))
    Post, Some(payload) -> Ok(#("post", "application/json", payload))
    Put, Some(payload) -> Ok(#("put", "application/json", payload))
    _, _ -> Error(TransportFailed("unsupported HTTP method for httpc"))
  }
}

fn percent_encode(value: String) -> String {
  // The values codegen produces (ids, tokens, part names) are already
  // URL-safe; encode just the reserved few.
  value
  |> string.replace(" ", "%20")
  |> string.replace("&", "%26")
  |> string.replace("=", "%3D")
  |> string.replace("?", "%3F")
  |> string.replace("#", "%23")
  |> string.replace("+", "%2B")
}

@external(erlang, "gleam_youtube_api_v3_httpc_ffi", "request")
fn ffi_request(
  method: String,
  url: String,
  headers: List(#(String, String)),
  content_type: String,
  body: String,
) -> Result(#(Int, List(#(String, String)), String), String)
