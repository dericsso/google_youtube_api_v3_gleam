//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Player to be used for a video playback.
pub type VideoPlayer {
  VideoPlayer(
    embed_height: Option(String),
    embed_html: Option(String),
    embed_width: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoPlayer) {
  use embed_height <- decode.optional_field(
    "embedHeight",
    option.None,
    decode.optional(decode.string),
  )
  use embed_html <- decode.optional_field(
    "embedHtml",
    option.None,
    decode.optional(decode.string),
  )
  use embed_width <- decode.optional_field(
    "embedWidth",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoPlayer(embed_height, embed_html, embed_width))
}

pub fn to_json(value: VideoPlayer) -> Json {
  json.object([
    #("embedHeight", json.nullable(value.embed_height, json.string)),
    #("embedHtml", json.nullable(value.embed_html, json.string)),
    #("embedWidth", json.nullable(value.embed_width, json.string)),
  ])
}
