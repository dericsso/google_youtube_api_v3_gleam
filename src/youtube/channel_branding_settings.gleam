//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, list, success}
import gleam/option
import youtube/channel_settings.{type ChannelSettings}
import youtube/image_settings.{type ImageSettings}
import youtube/property_value.{type PropertyValue}
import youtube/watch_settings.{type WatchSettings}

/// Branding properties of a YouTube channel.
pub type ChannelBrandingSettings {
  ChannelBrandingSettings(
    channel: option.Option(ChannelSettings),
    hints: option.Option(List(PropertyValue)),
    image: option.Option(ImageSettings),
    watch: option.Option(WatchSettings),
  )
}

pub fn decoder() -> Decoder(ChannelBrandingSettings) {
  use channel <- optional_field(
    "channel",
    option.None,
    optional(channel_settings.decoder()),
  )
  use hints <- optional_field(
    "hints",
    option.None,
    optional(list(property_value.decoder())),
  )
  use image <- optional_field(
    "image",
    option.None,
    optional(image_settings.decoder()),
  )
  use watch <- optional_field(
    "watch",
    option.None,
    optional(watch_settings.decoder()),
  )
  success(ChannelBrandingSettings(channel, hints, image, watch))
}