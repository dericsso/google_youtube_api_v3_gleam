//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/live_broadcast_content_details.{type LiveBroadcastContentDetails}
import youtube/live_broadcast_monetization_details.{type LiveBroadcastMonetizationDetails}
import youtube/live_broadcast_snippet.{type LiveBroadcastSnippet}
import youtube/live_broadcast_statistics.{type LiveBroadcastStatistics}
import youtube/live_broadcast_status.{type LiveBroadcastStatus}

/// A *liveBroadcast* resource represents an event that will be streamed, via live video, on YouTube.
pub type LiveBroadcast {
  LiveBroadcast(
    content_details: option.Option(LiveBroadcastContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    monetization_details: option.Option(LiveBroadcastMonetizationDetails),
    snippet: option.Option(LiveBroadcastSnippet),
    statistics: option.Option(LiveBroadcastStatistics),
    status: option.Option(LiveBroadcastStatus),
  )
}

pub fn decoder() -> Decoder(LiveBroadcast) {
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(live_broadcast_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use monetization_details <- optional_field(
    "monetizationDetails",
    option.None,
    optional(live_broadcast_monetization_details.decoder()),
  )
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(live_broadcast_snippet.decoder()),
  )
  use statistics <- optional_field(
    "statistics",
    option.None,
    optional(live_broadcast_statistics.decoder()),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(live_broadcast_status.decoder()),
  )
  success(
    LiveBroadcast(
      content_details,
      etag,
      id,
      kind,
      monetization_details,
      snippet,
      statistics,
      status,
    ),
  )
}