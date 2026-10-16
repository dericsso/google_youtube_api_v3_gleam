//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Branding properties for the watch. All deprecated.
pub type WatchSettings {
  WatchSettings(
    background_color: Option(String),
    featured_playlist_id: Option(String),
    text_color: Option(String),
  )
}

pub fn decoder() -> Decoder(WatchSettings) {
  use background_color <- decode.optional_field(
    "backgroundColor",
    option.None,
    decode.optional(decode.string),
  )
  use featured_playlist_id <- decode.optional_field(
    "featuredPlaylistId",
    option.None,
    decode.optional(decode.string),
  )
  use text_color <- decode.optional_field(
    "textColor",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(WatchSettings(
    background_color,
    featured_playlist_id,
    text_color,
  ))
}

pub fn to_json(value: WatchSettings) -> Json {
  json.object([
    #("backgroundColor", json.nullable(value.background_color, json.string)),
    #(
      "featuredPlaylistId",
      json.nullable(value.featured_playlist_id, json.string),
    ),
    #("textColor", json.nullable(value.text_color, json.string)),
  ])
}
