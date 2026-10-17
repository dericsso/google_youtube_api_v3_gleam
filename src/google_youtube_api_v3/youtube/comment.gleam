//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/comment_snippet.{type CommentSnippet}

/// A *comment* represents a single YouTube comment.
pub type Comment {
  Comment(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(CommentSnippet),
  )
}

pub fn decoder() -> Decoder(Comment) {
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
    decode.optional(comment_snippet.decoder()),
  )
  decode.success(Comment(etag, id, kind, snippet))
}

pub fn to_json(value: Comment) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, comment_snippet.to_json)),
    ],
  )
}