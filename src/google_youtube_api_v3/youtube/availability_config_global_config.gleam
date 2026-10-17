//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/interval.{type Interval}

/// Video is available in all regions except the ones specified in the excluded_region_codes list.
pub type AvailabilityConfigGlobalConfig {
  AvailabilityConfigGlobalConfig(
    excluded_region_codes: Option(List(String)),
    interval: Option(Interval),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfigGlobalConfig) {
  use excluded_region_codes <- decode.optional_field(
    "excludedRegionCodes",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use interval <- decode.optional_field(
    "interval",
    option.None,
    decode.optional(interval.decoder()),
  )
  decode.success(
    AvailabilityConfigGlobalConfig(excluded_region_codes, interval),
  )
}

pub fn to_json(value: AvailabilityConfigGlobalConfig) -> Json {
  json.object(
    [
      #(
        "excludedRegionCodes",
        json.nullable(
          value.excluded_region_codes,
          fn(items)
          { json.array(items, json.string) },
        ),
      ),
      #("interval", json.nullable(value.interval, interval.to_json)),
    ],
  )
}