//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/availability_config_regions_config_region_interval.{type AvailabilityConfigRegionsConfigRegionInterval}

/// Video is available in the specified regions only.
pub type AvailabilityConfigRegionsConfig {
  AvailabilityConfigRegionsConfig(
    region_intervals:
    Option(List(AvailabilityConfigRegionsConfigRegionInterval)),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfigRegionsConfig) {
  use region_intervals <- decode.optional_field(
    "regionIntervals",
    option.None,
    decode.optional(
      decode.list(availability_config_regions_config_region_interval.decoder()),
    ),
  )
  decode.success(AvailabilityConfigRegionsConfig(region_intervals))
}

pub fn to_json(value: AvailabilityConfigRegionsConfig) -> Json {
  json.object(
    [
      #(
        "regionIntervals",
        json.nullable(
          value.region_intervals,
          fn(items)
          {
            json.array(
              items,
              availability_config_regions_config_region_interval.to_json,
            )
          },
        ),
      ),
    ],
  )
}