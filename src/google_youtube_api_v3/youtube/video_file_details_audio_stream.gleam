//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Information about an audio stream.
pub type VideoFileDetailsAudioStream {
  VideoFileDetailsAudioStream(
    bitrate_bps: Option(String),
    channel_count: Option(Int),
    codec: Option(String),
    vendor: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoFileDetailsAudioStream) {
  use bitrate_bps <- decode.optional_field(
    "bitrateBps",
    option.None,
    decode.optional(decode.string),
  )
  use channel_count <- decode.optional_field(
    "channelCount",
    option.None,
    decode.optional(decode.int),
  )
  use codec <- decode.optional_field(
    "codec",
    option.None,
    decode.optional(decode.string),
  )
  use vendor <- decode.optional_field(
    "vendor",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    VideoFileDetailsAudioStream(bitrate_bps, channel_count, codec, vendor),
  )
}

pub fn to_json(value: VideoFileDetailsAudioStream) -> Json {
  json.object(
    [
      #("bitrateBps", json.nullable(value.bitrate_bps, json.string)),
      #("channelCount", json.nullable(value.channel_count, json.int)),
      #("codec", json.nullable(value.codec, json.string)),
      #("vendor", json.nullable(value.vendor, json.string)),
    ],
  )
}