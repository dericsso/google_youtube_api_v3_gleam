//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about an activity, including title, description, thumbnails, activity type and group. Next ID: 12
pub type ActivitySnippet {
  ActivitySnippet(
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    description: option.Option(String),
    group_id: option.Option(String),
    published_at: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(ActivitySnippet) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use channel_title <- optional_field(
    "channelTitle",
    option.None,
    optional(string),
  )
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use group_id <- optional_field("groupId", option.None, optional(string))
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
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(
    ActivitySnippet(
      channel_id,
      channel_title,
      description,
      group_id,
      published_at,
      thumbnails,
      title,
      type_,
    ),
  )
}

/// The type of activity that the resource describes.
pub type Type {
  TypeTypeUnspecified
  TypeUpload
  TypeComment
  TypeSubscription
  TypePlaylistItem
  TypeRecommendation
  TypeBulletin
  TypeSocial
  TypeChannelItem
  TypePromotedItem
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeTypeUnspecified -> "typeUnspecified"
    TypeUpload -> "upload"
    TypeComment -> "comment"
    TypeSubscription -> "subscription"
    TypePlaylistItem -> "playlistItem"
    TypeRecommendation -> "recommendation"
    TypeBulletin -> "bulletin"
    TypeSocial -> "social"
    TypeChannelItem -> "channelItem"
    TypePromotedItem -> "promotedItem"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- then(string)
  case value {
    "typeUnspecified" -> success(TypeTypeUnspecified)
    "upload" -> success(TypeUpload)
    "comment" -> success(TypeComment)
    "subscription" -> success(TypeSubscription)
    "playlistItem" -> success(TypePlaylistItem)
    "recommendation" -> success(TypeRecommendation)
    "bulletin" -> success(TypeBulletin)
    "social" -> success(TypeSocial)
    "channelItem" -> success(TypeChannelItem)
    "promotedItem" -> success(TypePromotedItem)
    _ -> failure(TypeTypeUnspecified, "a valid Type")
  }
}