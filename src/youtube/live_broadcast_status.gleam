//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Live broadcast state.
pub type LiveBroadcastStatus {
  LiveBroadcastStatus(
    life_cycle_status: option.Option(String),
    live_broadcast_priority: option.Option(String),
    made_for_kids: option.Option(Bool),
    privacy_status: option.Option(String),
    recording_status: option.Option(String),
    self_declared_made_for_kids: option.Option(Bool),
  )
}
