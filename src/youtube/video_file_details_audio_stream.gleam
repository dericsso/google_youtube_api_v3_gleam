//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
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

pub fn decoder() -> Decoder(VideoFileDetailsAudioStream) {
  use bitrate_bps <- optional_field("bitrateBps", option.None, optional(string))
  use channel_count <- optional_field(
    "channelCount",
    option.None,
    optional(int),
  )
  use codec <- optional_field("codec", option.None, optional(string))
  use vendor <- optional_field("vendor", option.None, optional(string))
  success(
    VideoFileDetailsAudioStream(bitrate_bps, channel_count, codec, vendor),
  )
}