//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Schedule to insert cuepoints into a broadcast by ads automator.
pub type CuepointSchedule {
  CuepointSchedule(
    enabled: option.Option(Bool),
    pause_ads_until: option.Option(String),
    repeat_interval_secs: option.Option(Int),
    schedule_strategy: option.Option(String),
  )
}
