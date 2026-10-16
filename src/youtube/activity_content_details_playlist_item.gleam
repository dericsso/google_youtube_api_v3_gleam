//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/resource_id.{type ResourceId}

/// Information about a new playlist item.
pub type ActivityContentDetailsPlaylistItem {
  ActivityContentDetailsPlaylistItem(
    playlist_id: Option(String),
    playlist_item_id: Option(String),
    resource_id: Option(ResourceId),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsPlaylistItem) {
  use playlist_id <- decode.optional_field(
    "playlistId",
    option.None,
    decode.optional(decode.string),
  )
  use playlist_item_id <- decode.optional_field(
    "playlistItemId",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  decode.success(ActivityContentDetailsPlaylistItem(
    playlist_id,
    playlist_item_id,
    resource_id,
  ))
}

pub fn to_json(value: ActivityContentDetailsPlaylistItem) -> Json {
  json.object([
    #("playlistId", json.nullable(value.playlist_id, json.string)),
    #("playlistItemId", json.nullable(value.playlist_item_id, json.string)),
    #("resourceId", json.nullable(value.resource_id, resource_id.to_json)),
  ])
}
