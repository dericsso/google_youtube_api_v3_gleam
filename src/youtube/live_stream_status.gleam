//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_stream_health_status.{type LiveStreamHealthStatus}

/// Brief description of the live stream status.
pub type LiveStreamStatus {
  LiveStreamStatus(
    health_status: option.Option(LiveStreamHealthStatus),
    stream_status: option.Option(String),
  )
}
