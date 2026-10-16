//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Information about an audio stream.
pub type VideoFileDetailsAudioStream {
  VideoFileDetailsAudioStream(
    bitrate_bps: option.Option(String),
    channel_count: option.Option(Int),
    codec: option.Option(String),
    vendor: option.Option(String),
  )
}
