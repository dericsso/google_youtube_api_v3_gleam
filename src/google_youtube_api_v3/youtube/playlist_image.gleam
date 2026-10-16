//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/playlist_image_snippet.{
  type PlaylistImageSnippet,
}

pub type PlaylistImage {
  PlaylistImage(
    id: Option(String),
    kind: Option(String),
    snippet: Option(PlaylistImageSnippet),
  )
}

pub fn decoder() -> Decoder(PlaylistImage) {
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(playlist_image_snippet.decoder()),
  )
  decode.success(PlaylistImage(id, kind, snippet))
}

pub fn to_json(value: PlaylistImage) -> Json {
  json.object([
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, playlist_image_snippet.to_json)),
  ])
}
