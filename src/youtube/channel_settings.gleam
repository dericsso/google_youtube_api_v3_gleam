//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, list, success}
import gleam/option

/// Branding properties for the channel view.
pub type ChannelSettings {
  ChannelSettings(
    country: option.Option(String),
    default_language: option.Option(String),
    default_tab: option.Option(String),
    description: option.Option(String),
    featured_channels_title: option.Option(String),
    featured_channels_urls: option.Option(List(String)),
    keywords: option.Option(String),
    moderate_comments: option.Option(Bool),
    profile_color: option.Option(String),
    show_browse_view: option.Option(Bool),
    show_related_channels: option.Option(Bool),
    title: option.Option(String),
    tracking_analytics_account_id: option.Option(String),
    unsubscribed_trailer: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelSettings) {
  use country <- optional_field("country", option.None, optional(string))
  use default_language <- optional_field(
    "defaultLanguage",
    option.None,
    optional(string),
  )
  use default_tab <- optional_field("defaultTab", option.None, optional(string))
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use featured_channels_title <- optional_field(
    "featuredChannelsTitle",
    option.None,
    optional(string),
  )
  use featured_channels_urls <- optional_field(
    "featuredChannelsUrls",
    option.None,
    optional(list(string)),
  )
  use keywords <- optional_field("keywords", option.None, optional(string))
  use moderate_comments <- optional_field(
    "moderateComments",
    option.None,
    optional(bool),
  )
  use profile_color <- optional_field(
    "profileColor",
    option.None,
    optional(string),
  )
  use show_browse_view <- optional_field(
    "showBrowseView",
    option.None,
    optional(bool),
  )
  use show_related_channels <- optional_field(
    "showRelatedChannels",
    option.None,
    optional(bool),
  )
  use title <- optional_field("title", option.None, optional(string))
  use tracking_analytics_account_id <- optional_field(
    "trackingAnalyticsAccountId",
    option.None,
    optional(string),
  )
  use unsubscribed_trailer <- optional_field(
    "unsubscribedTrailer",
    option.None,
    optional(string),
  )
  success(
    ChannelSettings(
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
    ),
  )
}