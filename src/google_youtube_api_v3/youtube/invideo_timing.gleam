//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Describes a temporal position of a visual widget inside a video.
pub type InvideoTiming {
  InvideoTiming(
    duration_ms: Option(String),
    offset_ms: Option(String),
    type_: Option(Type),
  )
}

pub fn decoder() -> Decoder(InvideoTiming) {
  use duration_ms <- decode.optional_field(
    "durationMs",
    option.None,
    decode.optional(decode.string),
  )
  use offset_ms <- decode.optional_field(
    "offsetMs",
    option.None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(InvideoTiming(duration_ms, offset_ms, type_))
}

pub fn to_json(value: InvideoTiming) -> Json {
  json.object(
    [
      #("durationMs", json.nullable(value.duration_ms, json.string)),
      #("offsetMs", json.nullable(value.offset_ms, json.string)),
      #(
        "type",
        json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
      ),
    ],
  )
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
  use value <- decode.then(decode.string)
  case value {
    "offsetFromStart" -> decode.success(TypeOffsetFromStart)
    "offsetFromEnd" -> decode.success(TypeOffsetFromEnd)
    _ -> decode.failure(TypeOffsetFromStart, "a valid Type")
  }
}