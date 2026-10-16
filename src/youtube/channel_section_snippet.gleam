//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success, then, failure}
import gleam/option
import youtube/channel_section_localization.{type ChannelSectionLocalization}

/// Basic details about a channel section, including title, style and position.
pub type ChannelSectionSnippet {
  ChannelSectionSnippet(
    channel_id: option.Option(String),
    default_language: option.Option(String),
    localized: option.Option(ChannelSectionLocalization),
    position: option.Option(Int),
    style: option.Option(Style),
    title: option.Option(String),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(ChannelSectionSnippet) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use default_language <- optional_field(
    "defaultLanguage",
    option.None,
    optional(string),
  )
  use localized <- optional_field(
    "localized",
    option.None,
    optional(channel_section_localization.decoder()),
  )
  use position <- optional_field("position", option.None, optional(int))
  use style <- optional_field("style", option.None, optional(style_decoder()))
  use title <- optional_field("title", option.None, optional(string))
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(
    ChannelSectionSnippet(
      channel_id,
      default_language,
      localized,
      position,
      style,
      title,
      type_,
    ),
  )
}

/// The style of the channel section.
pub type Style {
  StyleChannelsectionStyleUnspecified
  StyleHorizontalRow
  StyleVerticalList
}

pub fn style_to_string(value: Style) -> String {
  case value {
    StyleChannelsectionStyleUnspecified -> "channelsectionStyleUnspecified"
    StyleHorizontalRow -> "horizontalRow"
    StyleVerticalList -> "verticalList"
  }
}

pub fn style_decoder() -> Decoder(Style) {
  use value <- then(string)
  case value {
    "channelsectionStyleUnspecified" -> success(
      StyleChannelsectionStyleUnspecified,
    )
    "horizontalRow" -> success(StyleHorizontalRow)
    "verticalList" -> success(StyleVerticalList)
    _ -> failure(StyleChannelsectionStyleUnspecified, "a valid Style")
  }
}

/// The type of the channel section.
pub type Type {
  TypeChannelsectionTypeUndefined
  TypeSinglePlaylist
  TypeMultiplePlaylists
  TypePopularUploads
  TypeRecentUploads
  TypeLikes
  TypeAllPlaylists
  TypeLikedPlaylists
  TypeRecentPosts
  TypeRecentActivity
  TypeLiveEvents
  TypeUpcomingEvents
  TypeCompletedEvents
  TypeMultipleChannels
  TypePostedVideos
  TypePostedPlaylists
  TypeSubscriptions
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeChannelsectionTypeUndefined -> "channelsectionTypeUndefined"
    TypeSinglePlaylist -> "singlePlaylist"
    TypeMultiplePlaylists -> "multiplePlaylists"
    TypePopularUploads -> "popularUploads"
    TypeRecentUploads -> "recentUploads"
    TypeLikes -> "likes"
    TypeAllPlaylists -> "allPlaylists"
    TypeLikedPlaylists -> "likedPlaylists"
    TypeRecentPosts -> "recentPosts"
    TypeRecentActivity -> "recentActivity"
    TypeLiveEvents -> "liveEvents"
    TypeUpcomingEvents -> "upcomingEvents"
    TypeCompletedEvents -> "completedEvents"
    TypeMultipleChannels -> "multipleChannels"
    TypePostedVideos -> "postedVideos"
    TypePostedPlaylists -> "postedPlaylists"
    TypeSubscriptions -> "subscriptions"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- then(string)
  case value {
    "channelsectionTypeUndefined" -> success(TypeChannelsectionTypeUndefined)
    "singlePlaylist" -> success(TypeSinglePlaylist)
    "multiplePlaylists" -> success(TypeMultiplePlaylists)
    "popularUploads" -> success(TypePopularUploads)
    "recentUploads" -> success(TypeRecentUploads)
    "likes" -> success(TypeLikes)
    "allPlaylists" -> success(TypeAllPlaylists)
    "likedPlaylists" -> success(TypeLikedPlaylists)
    "recentPosts" -> success(TypeRecentPosts)
    "recentActivity" -> success(TypeRecentActivity)
    "liveEvents" -> success(TypeLiveEvents)
    "upcomingEvents" -> success(TypeUpcomingEvents)
    "completedEvents" -> success(TypeCompletedEvents)
    "multipleChannels" -> success(TypeMultipleChannels)
    "postedVideos" -> success(TypePostedVideos)
    "postedPlaylists" -> success(TypePostedPlaylists)
    "subscriptions" -> success(TypeSubscriptions)
    _ -> failure(TypeChannelsectionTypeUndefined, "a valid Type")
  }
}