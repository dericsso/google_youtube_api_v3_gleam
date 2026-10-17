//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Information about a video stream.
pub type VideoFileDetailsVideoStream {
  VideoFileDetailsVideoStream(
    aspect_ratio: Option(Float),
    bitrate_bps: Option(String),
    codec: Option(String),
    frame_rate_fps: Option(Float),
    height_pixels: Option(Int),
    rotation: Option(Rotation),
    vendor: Option(String),
    width_pixels: Option(Int),
  )
}

pub fn decoder() -> Decoder(VideoFileDetailsVideoStream) {
  use aspect_ratio <- decode.optional_field(
    "aspectRatio",
    option.None,
    decode.optional(decode.float),
  )
  use bitrate_bps <- decode.optional_field(
    "bitrateBps",
    option.None,
    decode.optional(decode.string),
  )
  use codec <- decode.optional_field(
    "codec",
    option.None,
    decode.optional(decode.string),
  )
  use frame_rate_fps <- decode.optional_field(
    "frameRateFps",
    option.None,
    decode.optional(decode.float),
  )
  use height_pixels <- decode.optional_field(
    "heightPixels",
    option.None,
    decode.optional(decode.int),
  )
  use rotation <- decode.optional_field(
    "rotation",
    option.None,
    decode.optional(rotation_decoder()),
  )
  use vendor <- decode.optional_field(
    "vendor",
    option.None,
    decode.optional(decode.string),
  )
  use width_pixels <- decode.optional_field(
    "widthPixels",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(
    VideoFileDetailsVideoStream(
      aspect_ratio,
      bitrate_bps,
      codec,
      frame_rate_fps,
      height_pixels,
      rotation,
      vendor,
      width_pixels,
    ),
  )
}

pub fn to_json(value: VideoFileDetailsVideoStream) -> Json {
  json.object(
    [
      #("aspectRatio", json.nullable(value.aspect_ratio, json.float)),
      #("bitrateBps", json.nullable(value.bitrate_bps, json.string)),
      #("codec", json.nullable(value.codec, json.string)),
      #("frameRateFps", json.nullable(value.frame_rate_fps, json.float)),
      #("heightPixels", json.nullable(value.height_pixels, json.int)),
      #(
        "rotation",
        json.nullable(
          value.rotation,
          fn(e)
          { json.string(rotation_to_string(e)) },
        ),
      ),
      #("vendor", json.nullable(value.vendor, json.string)),
      #("widthPixels", json.nullable(value.width_pixels, json.int)),
    ],
  )
}

/// The amount that YouTube needs to rotate the original source content to properly display the video.
pub type Rotation {
  RotationNone
  RotationClockwise
  RotationUpsideDown
  RotationCounterClockwise
  RotationOther
}

pub fn rotation_to_string(value: Rotation) -> String {
  case value {
    RotationNone -> "none"
    RotationClockwise -> "clockwise"
    RotationUpsideDown -> "upsideDown"
    RotationCounterClockwise -> "counterClockwise"
    RotationOther -> "other"
  }
}

pub fn rotation_decoder() -> Decoder(Rotation) {
  use value <- decode.then(decode.string)
  case value {
    "none" -> decode.success(RotationNone)
    "clockwise" -> decode.success(RotationClockwise)
    "upsideDown" -> decode.success(RotationUpsideDown)
    "counterClockwise" -> decode.success(RotationCounterClockwise)
    "other" -> decode.success(RotationOther)
    _ -> decode.failure(RotationNone, "a valid Rotation")
  }
}