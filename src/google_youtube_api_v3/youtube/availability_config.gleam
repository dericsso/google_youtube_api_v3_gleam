//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/availability_config_global_config.{
  type AvailabilityConfigGlobalConfig,
}
import google_youtube_api_v3/youtube/availability_config_regions_config.{
  type AvailabilityConfigRegionsConfig,
}

/// Common proto for Live and VOD geo-restrictions
pub type AvailabilityConfig {
  AvailabilityConfig(
    global_config: Option(AvailabilityConfigGlobalConfig),
    regions_config: Option(AvailabilityConfigRegionsConfig),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfig) {
  use global_config <- decode.optional_field(
    "globalConfig",
    option.None,
    decode.optional(availability_config_global_config.decoder()),
  )
  use regions_config <- decode.optional_field(
    "regionsConfig",
    option.None,
    decode.optional(availability_config_regions_config.decoder()),
  )
  decode.success(AvailabilityConfig(global_config, regions_config))
}

pub fn to_json(value: AvailabilityConfig) -> Json {
  json.object([
    #(
      "globalConfig",
      json.nullable(
        value.global_config,
        availability_config_global_config.to_json,
      ),
    ),
    #(
      "regionsConfig",
      json.nullable(
        value.regions_config,
        availability_config_regions_config.to_json,
      ),
    ),
  ])
}
