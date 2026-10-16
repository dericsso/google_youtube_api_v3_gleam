//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Schedule to insert cuepoints into a broadcast by ads automator.
pub type CuepointSchedule {
  CuepointSchedule(
    enabled: Option(Bool),
    pause_ads_until: Option(String),
    repeat_interval_secs: Option(Int),
    schedule_strategy: Option(ScheduleStrategy),
  )
}

pub fn decoder() -> Decoder(CuepointSchedule) {
  use enabled <- decode.optional_field(
    "enabled",
    option.None,
    decode.optional(decode.bool),
  )
  use pause_ads_until <- decode.optional_field(
    "pauseAdsUntil",
    option.None,
    decode.optional(decode.string),
  )
  use repeat_interval_secs <- decode.optional_field(
    "repeatIntervalSecs",
    option.None,
    decode.optional(decode.int),
  )
  use schedule_strategy <- decode.optional_field(
    "scheduleStrategy",
    option.None,
    decode.optional(schedule_strategy_decoder()),
  )
  decode.success(CuepointSchedule(
    enabled,
    pause_ads_until,
    repeat_interval_secs,
    schedule_strategy,
  ))
}

pub fn to_json(value: CuepointSchedule) -> Json {
  json.object([
    #("enabled", json.nullable(value.enabled, json.bool)),
    #("pauseAdsUntil", json.nullable(value.pause_ads_until, json.string)),
    #("repeatIntervalSecs", json.nullable(value.repeat_interval_secs, json.int)),
    #(
      "scheduleStrategy",
      json.nullable(value.schedule_strategy, fn(e) {
        json.string(schedule_strategy_to_string(e))
      }),
    ),
  ])
}

/// The strategy to use when scheduling cuepoints.
pub type ScheduleStrategy {
  ScheduleStrategyScheduleStrategyUnspecified
  ScheduleStrategyConcurrent
  ScheduleStrategyNonConcurrent
}

pub fn schedule_strategy_to_string(value: ScheduleStrategy) -> String {
  case value {
    ScheduleStrategyScheduleStrategyUnspecified -> "scheduleStrategyUnspecified"
    ScheduleStrategyConcurrent -> "concurrent"
    ScheduleStrategyNonConcurrent -> "nonConcurrent"
  }
}

pub fn schedule_strategy_decoder() -> Decoder(ScheduleStrategy) {
  use value <- decode.then(decode.string)
  case value {
    "scheduleStrategyUnspecified" ->
      decode.success(ScheduleStrategyScheduleStrategyUnspecified)
    "concurrent" -> decode.success(ScheduleStrategyConcurrent)
    "nonConcurrent" -> decode.success(ScheduleStrategyNonConcurrent)
    _ ->
      decode.failure(
        ScheduleStrategyScheduleStrategyUnspecified,
        "a valid ScheduleStrategy",
      )
  }
}
