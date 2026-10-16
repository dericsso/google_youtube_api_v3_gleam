//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/live_stream_health_status.{type LiveStreamHealthStatus}

/// Brief description of the live stream status.
pub type LiveStreamStatus {
  LiveStreamStatus(
    health_status: Option(LiveStreamHealthStatus),
    stream_status: Option(StreamStatus),
  )
}

pub fn decoder() -> Decoder(LiveStreamStatus) {
  use health_status <- decode.optional_field(
    "healthStatus",
    option.None,
    decode.optional(live_stream_health_status.decoder()),
  )
  use stream_status <- decode.optional_field(
    "streamStatus",
    option.None,
    decode.optional(stream_status_decoder()),
  )
  decode.success(LiveStreamStatus(health_status, stream_status))
}

pub fn to_json(value: LiveStreamStatus) -> Json {
  json.object([
    #(
      "healthStatus",
      json.nullable(value.health_status, live_stream_health_status.to_json),
    ),
    #(
      "streamStatus",
      json.nullable(value.stream_status, fn(e) {
        json.string(stream_status_to_string(e))
      }),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "created" -> decode.success(StreamStatusCreated)
    "ready" -> decode.success(StreamStatusReady)
    "active" -> decode.success(StreamStatusActive)
    "inactive" -> decode.success(StreamStatusInactive)
    "error" -> decode.success(StreamStatusError)
    _ -> decode.failure(StreamStatusCreated, "a valid StreamStatus")
  }
}
