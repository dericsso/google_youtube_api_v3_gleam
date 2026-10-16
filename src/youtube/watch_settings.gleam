//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Branding properties for the watch. All deprecated.
pub type WatchSettings {
  WatchSettings(
    background_color: option.Option(String),
    featured_playlist_id: option.Option(String),
    text_color: option.Option(String),
  )
}

pub fn decoder() -> Decoder(WatchSettings) {
  use background_color <- optional_field(
    "backgroundColor",
    option.None,
    optional(string),
  )
  use featured_playlist_id <- optional_field(
    "featuredPlaylistId",
    option.None,
    optional(string),
  )
  use text_color <- optional_field("textColor", option.None, optional(string))
  success(WatchSettings(background_color, featured_playlist_id, text_color))
}