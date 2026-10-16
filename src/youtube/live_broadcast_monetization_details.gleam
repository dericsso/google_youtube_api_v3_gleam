//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/cuepoint_schedule.{type CuepointSchedule}

/// Monetization settings of a broadcast.
pub type LiveBroadcastMonetizationDetails {
  LiveBroadcastMonetizationDetails(
    cuepoint_schedule: option.Option(CuepointSchedule),
  )
}
