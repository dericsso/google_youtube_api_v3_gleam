//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Statistics about the live broadcast. These represent a snapshot of the values at the time of the request. Statistics are only returned for live broadcasts.
pub type LiveBroadcastStatistics {
  LiveBroadcastStatistics(concurrent_viewers: option.Option(String))
}

pub fn decoder() -> Decoder(LiveBroadcastStatistics) {
  use concurrent_viewers <- optional_field(
    "concurrentViewers",
    option.None,
    optional(string),
  )
  success(LiveBroadcastStatistics(concurrent_viewers))
}