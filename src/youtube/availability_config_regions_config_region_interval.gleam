//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/interval.{type Interval}

/// Region and time window where video is available for the region.
pub type AvailabilityConfigRegionsConfigRegionInterval {
  AvailabilityConfigRegionsConfigRegionInterval(
    interval: option.Option(Interval),
    region_code: option.Option(String),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfigRegionsConfigRegionInterval) {
  use interval <- optional_field(
    "interval",
    option.None,
    optional(interval.decoder()),
  )
  use region_code <- optional_field("regionCode", option.None, optional(string))
  success(AvailabilityConfigRegionsConfigRegionInterval(interval, region_code))
}