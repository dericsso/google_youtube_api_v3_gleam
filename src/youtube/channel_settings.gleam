//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Branding properties for the channel view.
pub type ChannelSettings {
  ChannelSettings(
    country: Option(String),
    default_language: Option(String),
    default_tab: Option(String),
    description: Option(String),
    featured_channels_title: Option(String),
    featured_channels_urls: Option(List(String)),
    keywords: Option(String),
    moderate_comments: Option(Bool),
    profile_color: Option(String),
    show_browse_view: Option(Bool),
    show_related_channels: Option(Bool),
    title: Option(String),
    tracking_analytics_account_id: Option(String),
    unsubscribed_trailer: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelSettings) {
  use country <- decode.optional_field(
    "country",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use default_tab <- decode.optional_field(
    "defaultTab",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use featured_channels_title <- decode.optional_field(
    "featuredChannelsTitle",
    option.None,
    decode.optional(decode.string),
  )
  use featured_channels_urls <- decode.optional_field(
    "featuredChannelsUrls",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use keywords <- decode.optional_field(
    "keywords",
    option.None,
    decode.optional(decode.string),
  )
  use moderate_comments <- decode.optional_field(
    "moderateComments",
    option.None,
    decode.optional(decode.bool),
  )
  use profile_color <- decode.optional_field(
    "profileColor",
    option.None,
    decode.optional(decode.string),
  )
  use show_browse_view <- decode.optional_field(
    "showBrowseView",
    option.None,
    decode.optional(decode.bool),
  )
  use show_related_channels <- decode.optional_field(
    "showRelatedChannels",
    option.None,
    decode.optional(decode.bool),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  use tracking_analytics_account_id <- decode.optional_field(
    "trackingAnalyticsAccountId",
    option.None,
    decode.optional(decode.string),
  )
  use unsubscribed_trailer <- decode.optional_field(
    "unsubscribedTrailer",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelSettings(
    country,
    default_language,
    default_tab,
    description,
    featured_channels_title,
    featured_channels_urls,
    keywords,
    moderate_comments,
    profile_color,
    show_browse_view,
    show_related_channels,
    title,
    tracking_analytics_account_id,
    unsubscribed_trailer,
  ))
}

pub fn to_json(value: ChannelSettings) -> Json {
  json.object([
    #("country", json.nullable(value.country, json.string)),
    #("defaultLanguage", json.nullable(value.default_language, json.string)),
    #("defaultTab", json.nullable(value.default_tab, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #(
      "featuredChannelsTitle",
      json.nullable(value.featured_channels_title, json.string),
    ),
    #(
      "featuredChannelsUrls",
      json.nullable(value.featured_channels_urls, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #("keywords", json.nullable(value.keywords, json.string)),
    #("moderateComments", json.nullable(value.moderate_comments, json.bool)),
    #("profileColor", json.nullable(value.profile_color, json.string)),
    #("showBrowseView", json.nullable(value.show_browse_view, json.bool)),
    #(
      "showRelatedChannels",
      json.nullable(value.show_related_channels, json.bool),
    ),
    #("title", json.nullable(value.title, json.string)),
    #(
      "trackingAnalyticsAccountId",
      json.nullable(value.tracking_analytics_account_id, json.string),
    ),
    #(
      "unsubscribedTrailer",
      json.nullable(value.unsubscribed_trailer, json.string),
    ),
  ])
}
