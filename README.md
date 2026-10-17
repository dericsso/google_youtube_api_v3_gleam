# google_youtube_api_v3

[![Package Version](https://img.shields.io/hexpm/v/google_youtube_api_v3)](https://hex.pm/packages/google_youtube_api_v3)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/google_youtube_api_v3/)

Gleam bindings for the [YouTube Data API v3](https://developers.google.com/youtube/v3),
code-generated from Google's official
[discovery document](https://www.googleapis.com/discovery/v1/apis/youtube/v3/rest).

Each of the 209 API resource types gets its own module under `youtube/` with:

- a `pub type` with one field per API property (all optional, as the API
  itself treats them),
- schema-specific `pub fn <schema>_decoder()` functions built on
  `gleam/dynamic/decode`, using the original camelCase wire keys,
- matching `pub fn <schema>_to_json()` encoders,
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
import gleam/json
import gleam/option
import google_youtube_api_v3/request
import google_youtube_api_v3/youtube/api/video as video_api
import google_youtube_api_v3/youtube/playlist
import google_youtube_api_v3/youtube/video

pub fn video_title(body: String) -> option.Option(String) {
  // Decode a video resource. Missing fields become `None`,
  // unknown enum strings are a decode error, not silent garbage.
  let assert Ok(v) = json.parse(body, video.video_decoder())
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

pub fn most_popular(api_key: String) -> request.Request {
  // Build and authorize the request as pure data. Convert it with
  // request.to_http_request before passing it to any HTTP client.
  video_api.videos_list(["snippet"])
  |> video_api.videos_list_with_chart(video_api.VideosListChartMostPopular)
  |> video_api.videos_list_with_max_results(10)
  |> video_api.videos_list_request
  |> request.authorize(request.ApiKey(api_key))
}

// After sending the request with your HTTP client:
pub fn parse_most_popular_response(status: Int, body: String) {
  request.parse_response(
    status,
    body,
    video.video_list_response_decoder(),
  )
}
```

Further documentation can be found at <https://hexdocs.pm/google_youtube_api_v3/>.

## Development

```sh
gleam test
gleam dev                   # Regenerate from discovery/
gleam format src test
```

Regenerating wipes and rewrites `src/google_youtube_api_v3/youtube`, and `gleam dev` also
type-checks the tests — which import the generated modules. If the two
drift apart mid-change, move `test/generate_test.gleam` aside, regenerate,
format, and restore it.

The generator (`dev/google_youtube_api_v3_dev.gleam`) parses `discovery/` with
maintained `gleam/dynamic/decode` decoders and emits the generated schema and
request-builder modules with [gleamgen](https://hex.pm/packages/gleamgen).
Generated files under `src/google_youtube_api_v3/youtube/` are reproducible
artifacts; edit the generator rather than the output.

> **Disclosure:** this project is AI-assisted, not vibe-coded. An AI coding
> agent (via OpenCode) wrote the generator and the generated code
> under human direction, and a human reviews what gets committed. Every
> representative generated decoders are exercised by round-trip tests, and `gleam build` plus
> `gleam test` pass clean — trust the test suite, not the author list.
