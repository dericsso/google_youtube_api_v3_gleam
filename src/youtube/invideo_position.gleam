//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Describes the spatial position of a visual widget inside a video. It is a union of various position types, out of which only will be set one.
pub type InvideoPosition {
  InvideoPosition(
    corner_position: option.Option(String),
    type_: option.Option(String),
  )
}
