//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about an activity, including title, description, thumbnails, activity type and group. Next ID: 12
pub type ActivitySnippet {
  ActivitySnippet(
    channel_id: Option(String),
    channel_title: Option(String),
    description: Option(String),
    group_id: Option(String),
    published_at: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
    type_: Option(Type),
  )
}

pub fn decoder() -> Decoder(ActivitySnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_title <- decode.optional_field(
    "channelTitle",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use group_id <- decode.optional_field(
    "groupId",
    option.None,
    decode.optional(decode.string),
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
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(
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

pub fn to_json(value: ActivitySnippet) -> Json {
  json.object(
    [
      #("channelId", json.nullable(value.channel_id, json.string)),
      #("channelTitle", json.nullable(value.channel_title, json.string)),
      #("description", json.nullable(value.description, json.string)),
      #("groupId", json.nullable(value.group_id, json.string)),
      #("publishedAt", json.nullable(value.published_at, json.string)),
      #(
        "thumbnails",
        json.nullable(value.thumbnails, thumbnail_details.to_json),
      ),
      #("title", json.nullable(value.title, json.string)),
      #(
        "type",
        json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
      ),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "typeUnspecified" -> decode.success(TypeTypeUnspecified)
    "upload" -> decode.success(TypeUpload)
    "comment" -> decode.success(TypeComment)
    "subscription" -> decode.success(TypeSubscription)
    "playlistItem" -> decode.success(TypePlaylistItem)
    "recommendation" -> decode.success(TypeRecommendation)
    "bulletin" -> decode.success(TypeBulletin)
    "social" -> decode.success(TypeSocial)
    "channelItem" -> decode.success(TypeChannelItem)
    "promotedItem" -> decode.success(TypePromotedItem)
    _ -> decode.failure(TypeTypeUnspecified, "a valid Type")
  }
}