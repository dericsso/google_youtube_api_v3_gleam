//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Describes a temporal position of a visual widget inside a video.
pub type InvideoTiming {
  InvideoTiming(
    duration_ms: option.Option(String),
    offset_ms: option.Option(String),
    type_: option.Option(String),
  )
}
