//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/interval.{type Interval}

/// Region and time window where video is available for the region.
pub type AvailabilityConfigRegionsConfigRegionInterval {
  AvailabilityConfigRegionsConfigRegionInterval(
    interval: Option(Interval),
    region_code: Option(String),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfigRegionsConfigRegionInterval) {
  use interval <- decode.optional_field(
    "interval",
    option.None,
    decode.optional(interval.decoder()),
  )
  use region_code <- decode.optional_field(
    "regionCode",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    AvailabilityConfigRegionsConfigRegionInterval(interval, region_code),
  )
}

pub fn to_json(value: AvailabilityConfigRegionsConfigRegionInterval) -> Json {
  json.object(
    [
      #("interval", json.nullable(value.interval, interval.to_json)),
      #("regionCode", json.nullable(value.region_code, json.string)),
    ],
  )
}