//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
