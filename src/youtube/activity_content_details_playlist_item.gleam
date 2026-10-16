//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/resource_id.{type ResourceId}

/// Information about a new playlist item.
pub type ActivityContentDetailsPlaylistItem {
  ActivityContentDetailsPlaylistItem(
    playlist_id: option.Option(String),
    playlist_item_id: option.Option(String),
    resource_id: option.Option(ResourceId),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsPlaylistItem) {
  use playlist_id <- optional_field("playlistId", option.None, optional(string))
  use playlist_item_id <- optional_field(
    "playlistItemId",
    option.None,
    optional(string),
  )
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  success(
    ActivityContentDetailsPlaylistItem(
      playlist_id,
      playlist_item_id,
      resource_id,
    ),
  )
}