//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type PlaylistPlayer {
  PlaylistPlayer(embed_html: Option(String))
}

pub fn decoder() -> Decoder(PlaylistPlayer) {
  use embed_html <- decode.optional_field(
    "embedHtml",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PlaylistPlayer(embed_html))
}

pub fn to_json(value: PlaylistPlayer) -> Json {
  json.object([#("embedHtml", json.nullable(value.embed_html, json.string))])
}