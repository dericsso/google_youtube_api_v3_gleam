//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Statistics about the live broadcast. These represent a snapshot of the values at the time of the request. Statistics are only returned for live broadcasts.
pub type LiveBroadcastStatistics {
  LiveBroadcastStatistics(concurrent_viewers: option.Option(String))
}
