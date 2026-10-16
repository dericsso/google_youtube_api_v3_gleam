//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/video_category_snippet.{
  type VideoCategorySnippet,
}

/// A *videoCategory* resource identifies a category that has been or could be associated with uploaded videos.
pub type VideoCategory {
  VideoCategory(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(VideoCategorySnippet),
  )
}

pub fn decoder() -> Decoder(VideoCategory) {
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
    decode.optional(video_category_snippet.decoder()),
  )
  decode.success(VideoCategory(etag, id, kind, snippet))
}

pub fn to_json(value: VideoCategory) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, video_category_snippet.to_json)),
  ])
}
