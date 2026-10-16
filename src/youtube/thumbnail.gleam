//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
import gleam/option

/// A thumbnail is an image representing a YouTube resource.
pub type Thumbnail {
  Thumbnail(
    height: option.Option(Int),
    url: option.Option(String),
    width: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(Thumbnail) {
  use height <- optional_field("height", option.None, optional(int))
  use url <- optional_field("url", option.None, optional(string))
  use width <- optional_field("width", option.None, optional(int))
  success(Thumbnail(height, url, width))
}