//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/channel_localization.{type ChannelLocalization}
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a channel, including title, description and thumbnails.
pub type ChannelSnippet {
  ChannelSnippet(
    country: Option(String),
    custom_url: Option(String),
    default_language: Option(String),
    description: Option(String),
    localized: Option(ChannelLocalization),
    published_at: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelSnippet) {
  use country <- decode.optional_field(
    "country",
    option.None,
    decode.optional(decode.string),
  )
  use custom_url <- decode.optional_field(
    "customUrl",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(channel_localization.decoder()),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail_details.decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelSnippet(
    country,
    custom_url,
    default_language,
    description,
    localized,
    published_at,
    thumbnails,
    title,
  ))
}

pub fn to_json(value: ChannelSnippet) -> Json {
  json.object([
    #("country", json.nullable(value.country, json.string)),
    #("customUrl", json.nullable(value.custom_url, json.string)),
    #("defaultLanguage", json.nullable(value.default_language, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #("localized", json.nullable(value.localized, channel_localization.to_json)),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #("thumbnails", json.nullable(value.thumbnails, thumbnail_details.to_json)),
    #("title", json.nullable(value.title, json.string)),
  ])
}
