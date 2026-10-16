//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, float, success, then, failure}
import gleam/option

/// Information about a video stream.
pub type VideoFileDetailsVideoStream {
  VideoFileDetailsVideoStream(
    aspect_ratio: option.Option(Float),
    bitrate_bps: option.Option(String),
    codec: option.Option(String),
    frame_rate_fps: option.Option(Float),
    height_pixels: option.Option(Int),
    rotation: option.Option(Rotation),
    vendor: option.Option(String),
    width_pixels: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(VideoFileDetailsVideoStream) {
  use aspect_ratio <- optional_field(
    "aspectRatio",
    option.None,
    optional(float),
  )
  use bitrate_bps <- optional_field("bitrateBps", option.None, optional(string))
  use codec <- optional_field("codec", option.None, optional(string))
  use frame_rate_fps <- optional_field(
    "frameRateFps",
    option.None,
    optional(float),
  )
  use height_pixels <- optional_field(
    "heightPixels",
    option.None,
    optional(int),
  )
  use rotation <- optional_field(
    "rotation",
    option.None,
    optional(rotation_decoder()),
  )
  use vendor <- optional_field("vendor", option.None, optional(string))
  use width_pixels <- optional_field("widthPixels", option.None, optional(int))
  success(
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
  use value <- then(string)
  case value {
    "none" -> success(RotationNone)
    "clockwise" -> success(RotationClockwise)
    "upsideDown" -> success(RotationUpsideDown)
    "counterClockwise" -> success(RotationCounterClockwise)
    "other" -> success(RotationOther)
    _ -> failure(RotationNone, "a valid Rotation")
  }
}