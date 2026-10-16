//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/interval.{type Interval}

/// Video is available in all regions except the ones specified in the excluded_region_codes list.
pub type AvailabilityConfigGlobalConfig {
  AvailabilityConfigGlobalConfig(
    excluded_region_codes: option.Option(List(String)),
    interval: option.Option(Interval),
  )
}
