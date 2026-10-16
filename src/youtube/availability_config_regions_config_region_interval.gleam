//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/interval.{type Interval}

/// Region and time window where video is available for the region.
pub type AvailabilityConfigRegionsConfigRegionInterval {
  AvailabilityConfigRegionsConfigRegionInterval(
    interval: option.Option(Interval),
    region_code: option.Option(String),
  )
}
