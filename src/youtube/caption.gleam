//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/caption_snippet.{type CaptionSnippet}

/// A *caption* resource represents a YouTube caption track. A caption track is associated with exactly one YouTube video.
pub type Caption {
  Caption(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(CaptionSnippet),
  )
}

pub fn decoder() -> Decoder(Caption) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
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
    decode.optional(caption_snippet.decoder()),
  )
  decode.success(Caption(etag, id, kind, snippet))
}

pub fn to_json(value: Caption) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, caption_snippet.to_json)),
  ])
}
