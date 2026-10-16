//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type PlaylistPlayer {
  PlaylistPlayer(embed_html: option.Option(String))
}

pub fn decoder() -> Decoder(PlaylistPlayer) {
  use embed_html <- optional_field("embedHtml", option.None, optional(string))
  success(PlaylistPlayer(embed_html))
}