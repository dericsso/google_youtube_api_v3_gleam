//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
