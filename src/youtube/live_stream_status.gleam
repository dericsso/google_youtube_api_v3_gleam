//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/live_stream_health_status.{type LiveStreamHealthStatus}

/// Brief description of the live stream status.
pub type LiveStreamStatus {
  LiveStreamStatus(
    health_status: option.Option(LiveStreamHealthStatus),
    stream_status: option.Option(StreamStatus),
  )
}

pub fn decoder() -> Decoder(LiveStreamStatus) {
  use health_status <- optional_field(
    "healthStatus",
    option.None,
    optional(live_stream_health_status.decoder()),
  )
  use stream_status <- optional_field(
    "streamStatus",
    option.None,
    optional(stream_status_decoder()),
  )
  success(LiveStreamStatus(health_status, stream_status))
}

pub type StreamStatus {
  StreamStatusCreated
  StreamStatusReady
  StreamStatusActive
  StreamStatusInactive
  StreamStatusError
}

pub fn stream_status_to_string(value: StreamStatus) -> String {
  case value {
    StreamStatusCreated -> "created"
    StreamStatusReady -> "ready"
    StreamStatusActive -> "active"
    StreamStatusInactive -> "inactive"
    StreamStatusError -> "error"
  }
}

pub fn stream_status_decoder() -> Decoder(StreamStatus) {
  use value <- then(string)
  case value {
    "created" -> success(StreamStatusCreated)
    "ready" -> success(StreamStatusReady)
    "active" -> success(StreamStatusActive)
    "inactive" -> success(StreamStatusInactive)
    "error" -> success(StreamStatusError)
    _ -> failure(StreamStatusCreated, "a valid StreamStatus")
  }
}