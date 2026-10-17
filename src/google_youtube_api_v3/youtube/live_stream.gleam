//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/cdn_settings.{type CdnSettings}
import google_youtube_api_v3/youtube/live_stream_content_details.{type LiveStreamContentDetails}
import google_youtube_api_v3/youtube/live_stream_snippet.{type LiveStreamSnippet}
import google_youtube_api_v3/youtube/live_stream_status.{type LiveStreamStatus}

/// A live stream describes a live ingestion point.
pub type LiveStream {
  LiveStream(
    cdn: Option(CdnSettings),
    content_details: Option(LiveStreamContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(LiveStreamSnippet),
    status: Option(LiveStreamStatus),
  )
}

pub fn decoder() -> Decoder(LiveStream) {
  use cdn <- decode.optional_field(
    "cdn",
    option.None,
    decode.optional(cdn_settings.decoder()),
  )
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(live_stream_content_details.decoder()),
  )
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_stream_snippet.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(live_stream_status.decoder()),
  )
  decode.success(
    LiveStream(cdn, content_details, etag, id, kind, snippet, status),
  )
}

pub fn to_json(value: LiveStream) -> Json {
  json.object(
    [
      #("cdn", json.nullable(value.cdn, cdn_settings.to_json)),
      #(
        "contentDetails",
        json.nullable(
          value.content_details,
          live_stream_content_details.to_json,
        ),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, live_stream_snippet.to_json)),
      #("status", json.nullable(value.status, live_stream_status.to_json)),
    ],
  )
}