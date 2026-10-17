import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// A resource id is a generic reference that points to another YouTube resource.
pub type ResourceId {
  ResourceId(
    channel_id: Option(String),
    kind: Option(String),
    playlist_id: Option(String),
    video_id: Option(String),
  )
}

pub fn resource_id_decoder() -> Decoder(ResourceId) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use playlist_id <- decode.optional_field(
    "playlistId",
    option.None,
    decode.optional(decode.string),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ResourceId(channel_id, kind, playlist_id, video_id))
}

pub fn resource_id_to_json(value: ResourceId) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("playlistId", json.nullable(value.playlist_id, json.string)),
    #("videoId", json.nullable(value.video_id, json.string)),
  ])
}
