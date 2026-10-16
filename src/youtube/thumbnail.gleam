//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// A thumbnail is an image representing a YouTube resource.
pub type Thumbnail {
  Thumbnail(height: Option(Int), url: Option(String), width: Option(Int))
}

pub fn decoder() -> Decoder(Thumbnail) {
  use height <- decode.optional_field(
    "height",
    option.None,
    decode.optional(decode.int),
  )
  use url <- decode.optional_field(
    "url",
    option.None,
    decode.optional(decode.string),
  )
  use width <- decode.optional_field(
    "width",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(Thumbnail(height, url, width))
}

pub fn to_json(value: Thumbnail) -> Json {
  json.object([
    #("height", json.nullable(value.height, json.int)),
    #("url", json.nullable(value.url, json.string)),
    #("width", json.nullable(value.width, json.int)),
  ])
}
