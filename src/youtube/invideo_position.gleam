//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Describes the spatial position of a visual widget inside a video. It is a union of various position types, out of which only will be set one.
pub type InvideoPosition {
  InvideoPosition(
    corner_position: option.Option(CornerPosition),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(InvideoPosition) {
  use corner_position <- optional_field(
    "cornerPosition",
    option.None,
    optional(corner_position_decoder()),
  )
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(InvideoPosition(corner_position, type_))
}

/// Describes in which corner of the video the visual widget will appear.
pub type CornerPosition {
  CornerPositionTopLeft
  CornerPositionTopRight
  CornerPositionBottomLeft
  CornerPositionBottomRight
}

pub fn corner_position_to_string(value: CornerPosition) -> String {
  case value {
    CornerPositionTopLeft -> "topLeft"
    CornerPositionTopRight -> "topRight"
    CornerPositionBottomLeft -> "bottomLeft"
    CornerPositionBottomRight -> "bottomRight"
  }
}

pub fn corner_position_decoder() -> Decoder(CornerPosition) {
  use value <- then(string)
  case value {
    "topLeft" -> success(CornerPositionTopLeft)
    "topRight" -> success(CornerPositionTopRight)
    "bottomLeft" -> success(CornerPositionBottomLeft)
    "bottomRight" -> success(CornerPositionBottomRight)
    _ -> failure(CornerPositionTopLeft, "a valid CornerPosition")
  }
}

/// Defines the position type.
pub type Type {
  TypeCorner
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeCorner -> "corner"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- then(string)
  case value {
    "corner" -> success(TypeCorner)
    _ -> failure(TypeCorner, "a valid Type")
  }
}