//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Describes an invideo branding.
pub type InvideoBranding {
  InvideoBranding(
    image_bytes: Option(String),
    image_url: Option(String),
    position: Option(InvideoPosition),
    target_channel_id: Option(String),
    timing: Option(InvideoTiming),
  )
}

pub fn invideo_branding_decoder() -> Decoder(InvideoBranding) {
  use image_bytes <- decode.optional_field(
    "imageBytes",
    option.None,
    decode.optional(decode.string),
  )
  use image_url <- decode.optional_field(
    "imageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use position <- decode.optional_field(
    "position",
    option.None,
    decode.optional(invideo_position_decoder()),
  )
  use target_channel_id <- decode.optional_field(
    "targetChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use timing <- decode.optional_field(
    "timing",
    option.None,
    decode.optional(invideo_timing_decoder()),
  )
  decode.success(
    InvideoBranding(image_bytes, image_url, position, target_channel_id, timing),
  )
}

pub fn invideo_branding_to_json(value: InvideoBranding) -> Json {
  json.object(
    [
      #("imageBytes", json.nullable(value.image_bytes, json.string)),
      #("imageUrl", json.nullable(value.image_url, json.string)),
      #("position", json.nullable(value.position, invideo_position_to_json)),
      #("targetChannelId", json.nullable(value.target_channel_id, json.string)),
      #("timing", json.nullable(value.timing, invideo_timing_to_json)),
    ],
  )
}

/// Describes the spatial position of a visual widget inside a video. It is a union of various position types, out of which only will be set one.
pub type InvideoPosition {
  InvideoPosition(
    corner_position: Option(CornerPosition),
    type_: Option(InvideoPositionType),
  )
}

pub fn invideo_position_decoder() -> Decoder(InvideoPosition) {
  use corner_position <- decode.optional_field(
    "cornerPosition",
    option.None,
    decode.optional(corner_position_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(invideo_position_type_decoder()),
  )
  decode.success(InvideoPosition(corner_position, type_))
}

pub fn invideo_position_to_json(value: InvideoPosition) -> Json {
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
        json.nullable(
          value.type_,
          fn(e)
          { json.string(invideo_position_type_to_string(e)) },
        ),
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
pub type InvideoPositionType {
  InvideoPositionTypeCorner
}

pub fn invideo_position_type_to_string(value: InvideoPositionType) -> String {
  case value {
    InvideoPositionTypeCorner -> "corner"
  }
}

pub fn invideo_position_type_decoder() -> Decoder(InvideoPositionType) {
  use value <- decode.then(decode.string)
  case value {
    "corner" -> decode.success(InvideoPositionTypeCorner)
    _ -> decode.failure(
      InvideoPositionTypeCorner,
      "a valid InvideoPositionType",
    )
  }
}

/// Describes a temporal position of a visual widget inside a video.
pub type InvideoTiming {
  InvideoTiming(
    duration_ms: Option(String),
    offset_ms: Option(String),
    type_: Option(InvideoTimingType),
  )
}

pub fn invideo_timing_decoder() -> Decoder(InvideoTiming) {
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
    decode.optional(invideo_timing_type_decoder()),
  )
  decode.success(InvideoTiming(duration_ms, offset_ms, type_))
}

pub fn invideo_timing_to_json(value: InvideoTiming) -> Json {
  json.object(
    [
      #("durationMs", json.nullable(value.duration_ms, json.string)),
      #("offsetMs", json.nullable(value.offset_ms, json.string)),
      #(
        "type",
        json.nullable(
          value.type_,
          fn(e)
          { json.string(invideo_timing_type_to_string(e)) },
        ),
      ),
    ],
  )
}

/// Describes a timing type. If the value is offsetFromStart, then the offsetMs field represents an offset from the start of the video. If the value is offsetFromEnd, then the offsetMs field represents an offset from the end of the video.
pub type InvideoTimingType {
  InvideoTimingTypeOffsetFromStart
  InvideoTimingTypeOffsetFromEnd
}

pub fn invideo_timing_type_to_string(value: InvideoTimingType) -> String {
  case value {
    InvideoTimingTypeOffsetFromStart -> "offsetFromStart"
    InvideoTimingTypeOffsetFromEnd -> "offsetFromEnd"
  }
}

pub fn invideo_timing_type_decoder() -> Decoder(InvideoTimingType) {
  use value <- decode.then(decode.string)
  case value {
    "offsetFromStart" -> decode.success(InvideoTimingTypeOffsetFromStart)
    "offsetFromEnd" -> decode.success(InvideoTimingTypeOffsetFromEnd)
    _ -> decode.failure(
      InvideoTimingTypeOffsetFromStart,
      "a valid InvideoTimingType",
    )
  }
}