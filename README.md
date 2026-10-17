# google_youtube_api_v3

[![Package Version](https://img.shields.io/hexpm/v/google_youtube_api_v3)](https://hex.pm/packages/google_youtube_api_v3)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/google_youtube_api_v3/)

Gleam bindings for the [YouTube Data API v3](https://developers.google.com/youtube/v3),
code-generated from Google's official
[discovery document](https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest).

Each of the 209 API resource types gets its own module under `youtube/` with:

- a `pub type` with one field per API property (all optional, as the API
  itself treats them),
- a `pub fn decoder()` built on `gleam/dynamic/decode`, using the original
  camelCase wire keys,
- a `pub fn to_json()` encoder mirroring it,
- a real custom type plus `to_string`/`decoder` helpers for every
  string-enum field (e.g. `PrivacyStatusPublic` instead of a bare string).

The 32 API resources are grouped into 17 semantic fluent request-builder
modules under `youtube/api/` (all 83 methods), plus a Sans-IO runtime
in `google_youtube_api_v3/request` (maintained source, not generated):

- `video.videos_list(["snippet"]) |> video.videos_list_with_max_results(10)`
  builds params; `video.videos_list_request(params)` renders a pure `Request` value
  (verb, path, query pairs, scopes, optional JSON body),
- `request.authorize(req, request.ApiKey(key))` pins credentials,
- `request.parse_response(status, body, decoder)` decodes success bodies
  or Google's standard error object.

This is a **Sans-IO library**: it never performs I/O. You execute the
rendered `Request` with your own HTTP client — convert it with
`request.to_http_request` into a standard `gleam/http` record and hand
it to any ecosystem client such as `gleam_httpc`.

```sh
gleam add google_youtube_api_v3@1
```

```gleam
import gleam/httpc
import gleam/json
import gleam/option
import gleam/result
import google_youtube_api_v3/request
import google_youtube_api_v3/youtube/api/video as video_api
import google_youtube_api_v3/youtube/playlist
import google_youtube_api_v3/youtube/video

pub fn video_title(body: String) -> option.Option(String) {
  // Decode a video resource. Missing fields become `None`,
  // unknown enum strings are a decode error, not silent garbage.
  let assert Ok(v) = json.parse(body, video.decoder())
  case v.snippet {
    option.Some(snippet) -> snippet.title
    option.None -> option.None
  }
}

pub fn privacy_label(status: playlist.PlaylistItemStatus) -> String {
  case status.privacy_status {
    option.Some(s) -> playlist.playlist_item_status_privacy_status_to_string(s)
    option.None -> "unknown"
  }
}

pub fn most_popular(api_key: String) {
  // Build the request as pure data, convert it to a standard
  // `gleam/http` request, send it with Stock Erlang httpc, then parse
  // the response with a generated decoder.
  let req =
    video_api.videos_list(["snippet"])
    |> video_api.videos_list_with_chart(video_api.VideosListChartMostPopular)
    |> video_api.videos_list_with_max_results(10)
    |> video_api.videos_list_request
  use response <- result.try(
    req
    |> request.authorize(request.ApiKey(api_key))
    |> request.to_http_request
    |> httpc.send
    |> result.map_error(fn(_) { Nil }),
  )
  request.parse_response(
    response.status,
    response.body,
    video.video_list_response_decoder(),
  )
  |> result.map_error(fn(_) { Nil })
}
```

Further documentation can be found at <https://hexdocs.pm/google_youtube_api_v3/>.

## Development

```sh
gleam test                  # Run the tests
gleam dev  # Regenerate from discovery/
gleam format src test       # Generated code needs a format pass
```

Regenerating wipes and rewrites `src/youtube`, and `gleam run` also
type-checks the tests — which import the generated modules. If the two
drift apart mid-change, move `test/generate_test.gleam` aside, regenerate,
format, and restore it.

The generator (`src/generate.gleam`) parses `discovery/` with maintained
`gleam/dynamic/decode` decoders — covered by regression tests that pin
schema counts, method counts, and tallies per type — and emits each module
with [gleamgen](https://hex.pm/packages/gleamgen).

Vocabulary used here: *generated* files (everything under `src/youtube/`,
marked `DO NOT CHANGE`) are reproducible artifacts of the generator — edit
the generator, not the output. Everything else (`src/generate.gleam`,
`src/google_youtube_api_v3/`, tests) is *maintained* source: written with
AI assistance, reviewed by a human before commit.

> **Disclosure:** this project is AI-assisted, not vibe-coded. An AI coding
> agent (via OpenCode) wrote the generator and the generated code
> under human direction, and a human reviews what gets committed. Every
> generated decoder is exercised by round-trip tests, and `gleam build` plus
> `gleam test` pass clean — trust the test suite, not the author list.
