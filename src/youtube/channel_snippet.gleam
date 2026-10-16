//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
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

pub fn decoder() -> Decoder(ChannelSnippet) {
  use country <- optional_field("country", option.None, optional(string))
  use custom_url <- optional_field("customUrl", option.None, optional(string))
  use default_language <- optional_field(
    "defaultLanguage",
    option.None,
    optional(string),
  )
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use localized <- optional_field(
    "localized",
    option.None,
    optional(channel_localization.decoder()),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use thumbnails <- optional_field(
    "thumbnails",
    option.None,
    optional(thumbnail_details.decoder()),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(
    ChannelSnippet(
      country,
      custom_url,
      default_language,
      description,
      localized,
      published_at,
      thumbnails,
      title,
    ),
  )
}