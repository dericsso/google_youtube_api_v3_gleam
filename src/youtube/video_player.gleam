//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Player to be used for a video playback.
pub type VideoPlayer {
  VideoPlayer(
    embed_height: option.Option(String),
    embed_html: option.Option(String),
    embed_width: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoPlayer) {
  use embed_height <- optional_field(
    "embedHeight",
    option.None,
    optional(string),
  )
  use embed_html <- optional_field("embedHtml", option.None, optional(string))
  use embed_width <- optional_field("embedWidth", option.None, optional(string))
  success(VideoPlayer(embed_height, embed_html, embed_width))
}