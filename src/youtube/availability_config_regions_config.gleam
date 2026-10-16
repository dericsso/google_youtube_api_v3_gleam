//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/availability_config_regions_config_region_interval.{
  type AvailabilityConfigRegionsConfigRegionInterval,
}

/// Video is available in the specified regions only.
pub type AvailabilityConfigRegionsConfig {
  AvailabilityConfigRegionsConfig(
    region_intervals: option.Option(
      List(AvailabilityConfigRegionsConfigRegionInterval),
    ),
  )
}
