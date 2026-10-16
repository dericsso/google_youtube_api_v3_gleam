//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
import gleam/option
import youtube/resource_id.{type ResourceId}
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a playlist, including title, description and thumbnails. Basic details of a YouTube Playlist item provided by the author. Next ID: 15
pub type PlaylistItemSnippet {
  PlaylistItemSnippet(
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    description: option.Option(String),
    playlist_id: option.Option(String),
    position: option.Option(Int),
    published_at: option.Option(String),
    resource_id: option.Option(ResourceId),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
    video_owner_channel_id: option.Option(String),
    video_owner_channel_title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(PlaylistItemSnippet) {
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
  use playlist_id <- optional_field("playlistId", option.None, optional(string))
  use position <- optional_field("position", option.None, optional(int))
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  use thumbnails <- optional_field(
    "thumbnails",
    option.None,
    optional(thumbnail_details.decoder()),
  )
  use title <- optional_field("title", option.None, optional(string))
  use video_owner_channel_id <- optional_field(
    "videoOwnerChannelId",
    option.None,
    optional(string),
  )
  use video_owner_channel_title <- optional_field(
    "videoOwnerChannelTitle",
    option.None,
    optional(string),
  )
  success(
    PlaylistItemSnippet(
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
    ),
  )
}