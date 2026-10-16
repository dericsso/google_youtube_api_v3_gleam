//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// A resource id is a generic reference that points to another YouTube resource.
pub type ResourceId {
  ResourceId(
    channel_id: option.Option(String),
    kind: option.Option(String),
    playlist_id: option.Option(String),
    video_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ResourceId) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use playlist_id <- optional_field("playlistId", option.None, optional(string))
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(ResourceId(channel_id, kind, playlist_id, video_id))
}