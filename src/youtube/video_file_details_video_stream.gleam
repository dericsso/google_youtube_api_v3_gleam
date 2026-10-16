//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Information about a video stream.
pub type VideoFileDetailsVideoStream {
  VideoFileDetailsVideoStream(
    aspect_ratio: option.Option(Float),
    bitrate_bps: option.Option(String),
    codec: option.Option(String),
    frame_rate_fps: option.Option(Float),
    height_pixels: option.Option(Int),
    rotation: option.Option(String),
    vendor: option.Option(String),
    width_pixels: option.Option(Int),
  )
}
