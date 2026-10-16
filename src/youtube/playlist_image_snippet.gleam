//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success, then, failure}
import gleam/option

/// A *playlistImage* resource identifies another resource, such as a image, that is associated with a playlist. In addition, the playlistImage resource contains details about the included resource that pertain specifically to how that resource is used in that playlist. YouTube uses playlists to identify special collections of videos for a channel, such as: - uploaded videos - favorite videos - positively rated (liked) videos - watch history To be more specific, these lists are associated with a channel, which is a collection of a person, group, or company's videos, playlists, and other YouTube information. You can retrieve the playlist IDs for each of these lists from the channel resource for a given channel. You can then use the playlistImages.list method to retrieve image data for any of those playlists. You can also add or remove images from those lists by calling the playlistImages.insert and playlistImages.delete methods.
pub type PlaylistImageSnippet {
  PlaylistImageSnippet(
    height: option.Option(Int),
    playlist_id: option.Option(String),
    type_: option.Option(Type),
    width: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(PlaylistImageSnippet) {
  use height <- optional_field("height", option.None, optional(int))
  use playlist_id <- optional_field("playlistId", option.None, optional(string))
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  use width <- optional_field("width", option.None, optional(int))
  success(PlaylistImageSnippet(height, playlist_id, type_, width))
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
  use value <- then(string)
  case value {
    "hero" -> success(TypeHero)
    _ -> failure(TypeHero, "a valid Type")
  }
}