//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/cuepoint_schedule.{type CuepointSchedule}

/// Monetization settings of a broadcast.
pub type LiveBroadcastMonetizationDetails {
  LiveBroadcastMonetizationDetails(
    cuepoint_schedule: option.Option(CuepointSchedule),
  )
}

pub fn decoder() -> Decoder(LiveBroadcastMonetizationDetails) {
  use cuepoint_schedule <- optional_field(
    "cuepointSchedule",
    option.None,
    optional(cuepoint_schedule.decoder()),
  )
  success(LiveBroadcastMonetizationDetails(cuepoint_schedule))
}