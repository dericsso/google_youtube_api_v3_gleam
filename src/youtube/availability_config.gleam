//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/availability_config_global_config.{
  type AvailabilityConfigGlobalConfig,
}
import youtube/availability_config_regions_config.{
  type AvailabilityConfigRegionsConfig,
}

/// Common proto for Live and VOD geo-restrictions
pub type AvailabilityConfig {
  AvailabilityConfig(
    global_config: option.Option(AvailabilityConfigGlobalConfig),
    regions_config: option.Option(AvailabilityConfigRegionsConfig),
  )
}
