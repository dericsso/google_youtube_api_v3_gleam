//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
