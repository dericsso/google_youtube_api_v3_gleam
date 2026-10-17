//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Playlist localization setting
pub type PlaylistLocalization {
  PlaylistLocalization(description: Option(String), title: Option(String))
}

pub fn decoder() -> Decoder(PlaylistLocalization) {
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(PlaylistLocalization(description, title))
}

pub fn to_json(value: PlaylistLocalization) -> Json {
  json.object(
    [
      #("description", json.nullable(value.description, json.string)),
      #("title", json.nullable(value.title, json.string)),
    ],
  )
}