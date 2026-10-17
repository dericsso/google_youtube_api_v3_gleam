//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Statistics about the live broadcast. These represent a snapshot of the values at the time of the request. Statistics are only returned for live broadcasts.
pub type LiveBroadcastStatistics {
  LiveBroadcastStatistics(concurrent_viewers: Option(String))
}

pub fn decoder() -> Decoder(LiveBroadcastStatistics) {
  use concurrent_viewers <- decode.optional_field(
    "concurrentViewers",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveBroadcastStatistics(concurrent_viewers))
}

pub fn to_json(value: LiveBroadcastStatistics) -> Json {
  json.object(
    [
      #(
        "concurrentViewers",
        json.nullable(value.concurrent_viewers, json.string),
      ),
    ],
  )
}