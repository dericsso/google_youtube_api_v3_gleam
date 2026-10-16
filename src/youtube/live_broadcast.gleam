//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_broadcast_content_details.{type LiveBroadcastContentDetails}
import youtube/live_broadcast_monetization_details.{
  type LiveBroadcastMonetizationDetails,
}
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
