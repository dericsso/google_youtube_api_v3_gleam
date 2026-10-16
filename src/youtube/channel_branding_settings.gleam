//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
