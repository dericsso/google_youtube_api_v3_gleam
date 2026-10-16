//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/resource_id.{type ResourceId}
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a playlist, including title, description and thumbnails. Basic details of a YouTube Playlist item provided by the author. Next ID: 15
pub type PlaylistItemSnippet {
  PlaylistItemSnippet(
    channel_id: Option(String),
    channel_title: Option(String),
    description: Option(String),
    playlist_id: Option(String),
    position: Option(Int),
    published_at: Option(String),
    resource_id: Option(ResourceId),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
    video_owner_channel_id: Option(String),
    video_owner_channel_title: Option(String),
  )
}

pub fn decoder() -> Decoder(PlaylistItemSnippet) {
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
  use playlist_id <- decode.optional_field(
    "playlistId",
    option.None,
    decode.optional(decode.string),
  )
  use position <- decode.optional_field(
    "position",
    option.None,
    decode.optional(decode.int),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.decoder()),
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
  use video_owner_channel_id <- decode.optional_field(
    "videoOwnerChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use video_owner_channel_title <- decode.optional_field(
    "videoOwnerChannelTitle",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PlaylistItemSnippet(
    channel_id,
    channel_title,
    description,
    playlist_id,
    position,
    published_at,
    resource_id,
    thumbnails,
    title,
    video_owner_channel_id,
    video_owner_channel_title,
  ))
}

pub fn to_json(value: PlaylistItemSnippet) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("channelTitle", json.nullable(value.channel_title, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #("playlistId", json.nullable(value.playlist_id, json.string)),
    #("position", json.nullable(value.position, json.int)),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #("resourceId", json.nullable(value.resource_id, resource_id.to_json)),
    #("thumbnails", json.nullable(value.thumbnails, thumbnail_details.to_json)),
    #("title", json.nullable(value.title, json.string)),
    #(
      "videoOwnerChannelId",
      json.nullable(value.video_owner_channel_id, json.string),
    ),
    #(
      "videoOwnerChannelTitle",
      json.nullable(value.video_owner_channel_title, json.string),
    ),
  ])
}
