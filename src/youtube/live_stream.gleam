//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/cdn_settings.{type CdnSettings}
import youtube/live_stream_content_details.{type LiveStreamContentDetails}
import youtube/live_stream_snippet.{type LiveStreamSnippet}
import youtube/live_stream_status.{type LiveStreamStatus}

/// A live stream describes a live ingestion point.
pub type LiveStream {
  LiveStream(
    cdn: option.Option(CdnSettings),
    content_details: option.Option(LiveStreamContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(LiveStreamSnippet),
    status: option.Option(LiveStreamStatus),
  )
}

pub fn decoder() -> Decoder(LiveStream) {
  use cdn <- optional_field(
    "cdn",
    option.None,
    optional(cdn_settings.decoder()),
  )
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(live_stream_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(live_stream_snippet.decoder()),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(live_stream_status.decoder()),
  )
  success(LiveStream(cdn, content_details, etag, id, kind, snippet, status))
}