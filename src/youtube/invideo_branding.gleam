//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/invideo_position.{type InvideoPosition}
import youtube/invideo_timing.{type InvideoTiming}

/// Describes an invideo branding.
pub type InvideoBranding {
  InvideoBranding(
    image_bytes: option.Option(String),
    image_url: option.Option(String),
    position: option.Option(InvideoPosition),
    target_channel_id: option.Option(String),
    timing: option.Option(InvideoTiming),
  )
}
