//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Describes the spatial position of a visual widget inside a video. It is a union of various position types, out of which only will be set one.
pub type InvideoPosition {
  InvideoPosition(corner_position: Option(CornerPosition), type_: Option(Type))
}

pub fn decoder() -> Decoder(InvideoPosition) {
  use corner_position <- decode.optional_field(
    "cornerPosition",
    option.None,
    decode.optional(corner_position_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(InvideoPosition(corner_position, type_))
}

pub fn to_json(value: InvideoPosition) -> Json {
  json.object(
    [
      #(
        "cornerPosition",
        json.nullable(
          value.corner_position,
          fn(e)
          { json.string(corner_position_to_string(e)) },
        ),
      ),
      #(
        "type",
        json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
      ),
    ],
  )
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
  use value <- decode.then(decode.string)
  case value {
    "topLeft" -> decode.success(CornerPositionTopLeft)
    "topRight" -> decode.success(CornerPositionTopRight)
    "bottomLeft" -> decode.success(CornerPositionBottomLeft)
    "bottomRight" -> decode.success(CornerPositionBottomRight)
    _ -> decode.failure(CornerPositionTopLeft, "a valid CornerPosition")
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
  use value <- decode.then(decode.string)
  case value {
    "corner" -> decode.success(TypeCorner)
    _ -> decode.failure(TypeCorner, "a valid Type")
  }
}