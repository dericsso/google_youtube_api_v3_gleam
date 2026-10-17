//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Common proto for Live and VOD geo-restrictions
pub type AvailabilityConfig {
  AvailabilityConfig(
    global_config: Option(AvailabilityConfigGlobalConfig),
    regions_config: Option(AvailabilityConfigRegionsConfig),
  )
}

pub fn availability_config_decoder() -> Decoder(AvailabilityConfig) {
  use global_config <- decode.optional_field(
    "globalConfig",
    option.None,
    decode.optional(availability_config_global_config_decoder()),
  )
  use regions_config <- decode.optional_field(
    "regionsConfig",
    option.None,
    decode.optional(availability_config_regions_config_decoder()),
  )
  decode.success(AvailabilityConfig(global_config, regions_config))
}

pub fn availability_config_to_json(value: AvailabilityConfig) -> Json {
  json.object(
    [
      #(
        "globalConfig",
        json.nullable(
          value.global_config,
          availability_config_global_config_to_json,
        ),
      ),
      #(
        "regionsConfig",
        json.nullable(
          value.regions_config,
          availability_config_regions_config_to_json,
        ),
      ),
    ],
  )
}

/// Video is available in all regions except the ones specified in the excluded_region_codes list.
pub type AvailabilityConfigGlobalConfig {
  AvailabilityConfigGlobalConfig(
    excluded_region_codes: Option(List(String)),
    interval: Option(Interval),
  )
}

pub fn availability_config_global_config_decoder() -> Decoder(
  AvailabilityConfigGlobalConfig,
) {
  use excluded_region_codes <- decode.optional_field(
    "excludedRegionCodes",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use interval <- decode.optional_field(
    "interval",
    option.None,
    decode.optional(interval_decoder()),
  )
  decode.success(
    AvailabilityConfigGlobalConfig(excluded_region_codes, interval),
  )
}

pub fn availability_config_global_config_to_json(
  value: AvailabilityConfigGlobalConfig,
) -> Json {
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
      #("interval", json.nullable(value.interval, interval_to_json)),
    ],
  )
}

/// Video is available in the specified regions only.
pub type AvailabilityConfigRegionsConfig {
  AvailabilityConfigRegionsConfig(
    region_intervals:
    Option(List(AvailabilityConfigRegionsConfigRegionInterval)),
  )
}

pub fn availability_config_regions_config_decoder() -> Decoder(
  AvailabilityConfigRegionsConfig,
) {
  use region_intervals <- decode.optional_field(
    "regionIntervals",
    option.None,
    decode.optional(
      decode.list(availability_config_regions_config_region_interval_decoder()),
    ),
  )
  decode.success(AvailabilityConfigRegionsConfig(region_intervals))
}

pub fn availability_config_regions_config_to_json(
  value: AvailabilityConfigRegionsConfig,
) -> Json {
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
              availability_config_regions_config_region_interval_to_json,
            )
          },
        ),
      ),
    ],
  )
}

/// Region and time window where video is available for the region.
pub type AvailabilityConfigRegionsConfigRegionInterval {
  AvailabilityConfigRegionsConfigRegionInterval(
    interval: Option(Interval),
    region_code: Option(String),
  )
}

pub fn availability_config_regions_config_region_interval_decoder() -> Decoder(
  AvailabilityConfigRegionsConfigRegionInterval,
) {
  use interval <- decode.optional_field(
    "interval",
    option.None,
    decode.optional(interval_decoder()),
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

pub fn availability_config_regions_config_region_interval_to_json(
  value: AvailabilityConfigRegionsConfigRegionInterval,
) -> Json {
  json.object(
    [
      #("interval", json.nullable(value.interval, interval_to_json)),
      #("regionCode", json.nullable(value.region_code, json.string)),
    ],
  )
}

/// Represents a time interval, encoded as a Timestamp start (inclusive) and a Timestamp end (exclusive). The start must be less than or equal to the end. When the start equals the end, the interval is empty (matches no time). When both start and end are unspecified, the interval matches any time.
pub type Interval {
  Interval(end_time: Option(String), start_time: Option(String))
}

pub fn interval_decoder() -> Decoder(Interval) {
  use end_time <- decode.optional_field(
    "endTime",
    option.None,
    decode.optional(decode.string),
  )
  use start_time <- decode.optional_field(
    "startTime",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(Interval(end_time, start_time))
}

pub fn interval_to_json(value: Interval) -> Json {
  json.object(
    [
      #("endTime", json.nullable(value.end_time, json.string)),
      #("startTime", json.nullable(value.start_time, json.string)),
    ],
  )
}