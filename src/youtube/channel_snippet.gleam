//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_localization.{type ChannelLocalization}
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a channel, including title, description and thumbnails.
pub type ChannelSnippet {
  ChannelSnippet(
    country: option.Option(String),
    custom_url: option.Option(String),
    default_language: option.Option(String),
    description: option.Option(String),
    localized: option.Option(ChannelLocalization),
    published_at: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}
