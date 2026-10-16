//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, bool, success, then, failure}
import gleam/option

/// Schedule to insert cuepoints into a broadcast by ads automator.
pub type CuepointSchedule {
  CuepointSchedule(
    enabled: option.Option(Bool),
    pause_ads_until: option.Option(String),
    repeat_interval_secs: option.Option(Int),
    schedule_strategy: option.Option(ScheduleStrategy),
  )
}

pub fn decoder() -> Decoder(CuepointSchedule) {
  use enabled <- optional_field("enabled", option.None, optional(bool))
  use pause_ads_until <- optional_field(
    "pauseAdsUntil",
    option.None,
    optional(string),
  )
  use repeat_interval_secs <- optional_field(
    "repeatIntervalSecs",
    option.None,
    optional(int),
  )
  use schedule_strategy <- optional_field(
    "scheduleStrategy",
    option.None,
    optional(schedule_strategy_decoder()),
  )
  success(
    CuepointSchedule(
      enabled,
      pause_ads_until,
      repeat_interval_secs,
      schedule_strategy,
    ),
  )
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
  use value <- then(string)
  case value {
    "scheduleStrategyUnspecified" -> success(
      ScheduleStrategyScheduleStrategyUnspecified,
    )
    "concurrent" -> success(ScheduleStrategyConcurrent)
    "nonConcurrent" -> success(ScheduleStrategyNonConcurrent)
    _ -> failure(
      ScheduleStrategyScheduleStrategyUnspecified,
      "a valid ScheduleStrategy",
    )
  }
}