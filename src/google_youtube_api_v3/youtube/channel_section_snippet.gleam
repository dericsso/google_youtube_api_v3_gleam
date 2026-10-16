//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_section_localization.{
  type ChannelSectionLocalization,
}

/// Basic details about a channel section, including title, style and position.
pub type ChannelSectionSnippet {
  ChannelSectionSnippet(
    channel_id: Option(String),
    default_language: Option(String),
    localized: Option(ChannelSectionLocalization),
    position: Option(Int),
    style: Option(Style),
    title: Option(String),
    type_: Option(Type),
  )
}

pub fn decoder() -> Decoder(ChannelSectionSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use default_language <- decode.optional_field(
    "defaultLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use localized <- decode.optional_field(
    "localized",
    option.None,
    decode.optional(channel_section_localization.decoder()),
  )
  use position <- decode.optional_field(
    "position",
    option.None,
    decode.optional(decode.int),
  )
  use style <- decode.optional_field(
    "style",
    option.None,
    decode.optional(style_decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(ChannelSectionSnippet(
    channel_id,
    default_language,
    localized,
    position,
    style,
    title,
    type_,
  ))
}

pub fn to_json(value: ChannelSectionSnippet) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("defaultLanguage", json.nullable(value.default_language, json.string)),
    #(
      "localized",
      json.nullable(value.localized, channel_section_localization.to_json),
    ),
    #("position", json.nullable(value.position, json.int)),
    #(
      "style",
      json.nullable(value.style, fn(e) { json.string(style_to_string(e)) }),
    ),
    #("title", json.nullable(value.title, json.string)),
    #(
      "type",
      json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "channelsectionStyleUnspecified" ->
      decode.success(StyleChannelsectionStyleUnspecified)
    "horizontalRow" -> decode.success(StyleHorizontalRow)
    "verticalList" -> decode.success(StyleVerticalList)
    _ -> decode.failure(StyleChannelsectionStyleUnspecified, "a valid Style")
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
  use value <- decode.then(decode.string)
  case value {
    "channelsectionTypeUndefined" ->
      decode.success(TypeChannelsectionTypeUndefined)
    "singlePlaylist" -> decode.success(TypeSinglePlaylist)
    "multiplePlaylists" -> decode.success(TypeMultiplePlaylists)
    "popularUploads" -> decode.success(TypePopularUploads)
    "recentUploads" -> decode.success(TypeRecentUploads)
    "likes" -> decode.success(TypeLikes)
    "allPlaylists" -> decode.success(TypeAllPlaylists)
    "likedPlaylists" -> decode.success(TypeLikedPlaylists)
    "recentPosts" -> decode.success(TypeRecentPosts)
    "recentActivity" -> decode.success(TypeRecentActivity)
    "liveEvents" -> decode.success(TypeLiveEvents)
    "upcomingEvents" -> decode.success(TypeUpcomingEvents)
    "completedEvents" -> decode.success(TypeCompletedEvents)
    "multipleChannels" -> decode.success(TypeMultipleChannels)
    "postedVideos" -> decode.success(TypePostedVideos)
    "postedPlaylists" -> decode.success(TypePostedPlaylists)
    "subscriptions" -> decode.success(TypeSubscriptions)
    _ -> decode.failure(TypeChannelsectionTypeUndefined, "a valid Type")
  }
}
