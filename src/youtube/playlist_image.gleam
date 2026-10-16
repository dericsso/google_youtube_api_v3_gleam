//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/playlist_image_snippet.{type PlaylistImageSnippet}

pub type PlaylistImage {
  PlaylistImage(
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(PlaylistImageSnippet),
  )
}

pub fn decoder() -> Decoder(PlaylistImage) {
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(playlist_image_snippet.decoder()),
  )
  success(PlaylistImage(id, kind, snippet))
}