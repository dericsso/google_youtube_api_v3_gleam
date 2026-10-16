//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, list, success}
import gleam/option
import youtube/availability_config_regions_config_region_interval.{type AvailabilityConfigRegionsConfigRegionInterval}

/// Video is available in the specified regions only.
pub type AvailabilityConfigRegionsConfig {
  AvailabilityConfigRegionsConfig(
    region_intervals:
    option.Option(List(AvailabilityConfigRegionsConfigRegionInterval)),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfigRegionsConfig) {
  use region_intervals <- optional_field(
    "regionIntervals",
    option.None,
    optional(list(availability_config_regions_config_region_interval.decoder())),
  )
  success(AvailabilityConfigRegionsConfig(region_intervals))
}