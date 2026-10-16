//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/cuepoint_schedule.{type CuepointSchedule}

/// Monetization settings of a broadcast.
pub type LiveBroadcastMonetizationDetails {
  LiveBroadcastMonetizationDetails(cuepoint_schedule: Option(CuepointSchedule))
}

pub fn decoder() -> Decoder(LiveBroadcastMonetizationDetails) {
  use cuepoint_schedule <- decode.optional_field(
    "cuepointSchedule",
    option.None,
    decode.optional(cuepoint_schedule.decoder()),
  )
  decode.success(LiveBroadcastMonetizationDetails(cuepoint_schedule))
}

pub fn to_json(value: LiveBroadcastMonetizationDetails) -> Json {
  json.object([
    #(
      "cuepointSchedule",
      json.nullable(value.cuepoint_schedule, cuepoint_schedule.to_json),
    ),
  ])
}
