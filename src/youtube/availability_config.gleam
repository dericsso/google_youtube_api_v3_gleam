//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/availability_config_global_config.{type AvailabilityConfigGlobalConfig}
import youtube/availability_config_regions_config.{type AvailabilityConfigRegionsConfig}

/// Common proto for Live and VOD geo-restrictions
pub type AvailabilityConfig {
  AvailabilityConfig(
    global_config: option.Option(AvailabilityConfigGlobalConfig),
    regions_config: option.Option(AvailabilityConfigRegionsConfig),
  )
}

pub fn decoder() -> Decoder(AvailabilityConfig) {
  use global_config <- optional_field(
    "globalConfig",
    option.None,
    optional(availability_config_global_config.decoder()),
  )
  use regions_config <- optional_field(
    "regionsConfig",
    option.None,
    optional(availability_config_regions_config.decoder()),
  )
  success(AvailabilityConfig(global_config, regions_config))
}