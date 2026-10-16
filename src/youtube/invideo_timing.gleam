//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Describes a temporal position of a visual widget inside a video.
pub type InvideoTiming {
  InvideoTiming(
    duration_ms: option.Option(String),
    offset_ms: option.Option(String),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(InvideoTiming) {
  use duration_ms <- optional_field("durationMs", option.None, optional(string))
  use offset_ms <- optional_field("offsetMs", option.None, optional(string))
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(InvideoTiming(duration_ms, offset_ms, type_))
}

/// Describes a timing type. If the value is offsetFromStart, then the offsetMs field represents an offset from the start of the video. If the value is offsetFromEnd, then the offsetMs field represents an offset from the end of the video.
pub type Type {
  TypeOffsetFromStart
  TypeOffsetFromEnd
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeOffsetFromStart -> "offsetFromStart"
    TypeOffsetFromEnd -> "offsetFromEnd"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- then(string)
  case value {
    "offsetFromStart" -> success(TypeOffsetFromStart)
    "offsetFromEnd" -> success(TypeOffsetFromEnd)
    _ -> failure(TypeOffsetFromStart, "a valid Type")
  }
}