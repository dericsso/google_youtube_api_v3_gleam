//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
