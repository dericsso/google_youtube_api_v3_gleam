//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// DEPRECATED Region restriction of the video.
pub type VideoContentDetailsRegionRestriction {
  VideoContentDetailsRegionRestriction(
    allowed: option.Option(List(String)),
    blocked: option.Option(List(String)),
  )
}
