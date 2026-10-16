//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
