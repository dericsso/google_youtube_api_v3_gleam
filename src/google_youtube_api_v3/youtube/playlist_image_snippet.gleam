//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// A *playlistImage* resource identifies another resource, such as a image, that is associated with a playlist. In addition, the playlistImage resource contains details about the included resource that pertain specifically to how that resource is used in that playlist. YouTube uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistImages.list method to retrieve image data for any of those playlists. You can also add or remove images from those lists by calling the playlistImages.insert and playlistImages.delete methods.
pub type PlaylistImageSnippet {
  PlaylistImageSnippet(
    height: Option(Int),
    playlist_id: Option(String),
    type_: Option(Type),
    width: Option(Int),
  )
}

pub fn decoder() -> Decoder(PlaylistImageSnippet) {
  use height <- decode.optional_field(
    "height",
    option.None,
    decode.optional(decode.int),
  )
  use playlist_id <- decode.optional_field(
    "playlistId",
    option.None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  use width <- decode.optional_field(
    "width",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(PlaylistImageSnippet(height, playlist_id, type_, width))
}

pub fn to_json(value: PlaylistImageSnippet) -> Json {
  json.object([
    #("height", json.nullable(value.height, json.int)),
    #("playlistId", json.nullable(value.playlist_id, json.string)),
    #(
      "type",
      json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
    ),
    #("width", json.nullable(value.width, json.int)),
  ])
}

/// The image type.
pub type Type {
  TypeHero
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeHero -> "hero"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- decode.then(decode.string)
  case value {
    "hero" -> decode.success(TypeHero)
    _ -> decode.failure(TypeHero, "a valid Type")
  }
}
