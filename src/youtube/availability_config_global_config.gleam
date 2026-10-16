//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/interval.{type Interval}

/// Video is available in all regions except the ones specified in the excluded_region_codes list.
pub type AvailabilityConfigGlobalConfig {
  AvailabilityConfigGlobalConfig(
    excluded_region_codes: option.Option(List(String)),
    interval: option.Option(Interval),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfigGlobalConfig) {
  use excluded_region_codes <- optional_field(
    "excludedRegionCodes",
    option.None,
    optional(list(string)),
  )
  use interval <- optional_field(
    "interval",
    option.None,
    optional(interval.decoder()),
  )
  success(AvailabilityConfigGlobalConfig(excluded_region_codes, interval))
}