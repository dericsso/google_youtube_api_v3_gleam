//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_settings.{type ChannelSettings}
import google_youtube_api_v3/youtube/image_settings.{type ImageSettings}
import google_youtube_api_v3/youtube/property_value.{type PropertyValue}
import google_youtube_api_v3/youtube/watch_settings.{type WatchSettings}

/// Branding properties of a YouTube channel.
pub type ChannelBrandingSettings {
  ChannelBrandingSettings(
    channel: Option(ChannelSettings),
    hints: Option(List(PropertyValue)),
    image: Option(ImageSettings),
    watch: Option(WatchSettings),
  )
}

pub fn decoder() -> Decoder(ChannelBrandingSettings) {
  use channel <- decode.optional_field(
    "channel",
    option.None,
    decode.optional(channel_settings.decoder()),
  )
  use hints <- decode.optional_field(
    "hints",
    option.None,
    decode.optional(decode.list(property_value.decoder())),
  )
  use image <- decode.optional_field(
    "image",
    option.None,
    decode.optional(image_settings.decoder()),
  )
  use watch <- decode.optional_field(
    "watch",
    option.None,
    decode.optional(watch_settings.decoder()),
  )
  decode.success(ChannelBrandingSettings(channel, hints, image, watch))
}

pub fn to_json(value: ChannelBrandingSettings) -> Json {
  json.object(
    [
      #("channel", json.nullable(value.channel, channel_settings.to_json)),
      #(
        "hints",
        json.nullable(
          value.hints,
          fn(items)
          { json.array(items, property_value.to_json) },
        ),
      ),
      #("image", json.nullable(value.image, image_settings.to_json)),
      #("watch", json.nullable(value.watch, watch_settings.to_json)),
    ],
  )
}