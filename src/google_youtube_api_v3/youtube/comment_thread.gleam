//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/comment_thread_replies.{type CommentThreadReplies}
import google_youtube_api_v3/youtube/comment_thread_snippet.{type CommentThreadSnippet}

/// A *comment thread* represents information that applies to a top level comment and all its replies. It can also include the top level comment itself and some of the replies.
pub type CommentThread {
  CommentThread(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    replies: Option(CommentThreadReplies),
    snippet: Option(CommentThreadSnippet),
  )
}

pub fn decoder() -> Decoder(CommentThread) {
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
  use replies <- decode.optional_field(
    "replies",
    option.None,
    decode.optional(comment_thread_replies.decoder()),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(comment_thread_snippet.decoder()),
  )
  decode.success(CommentThread(etag, id, kind, replies, snippet))
}

pub fn to_json(value: CommentThread) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("replies", json.nullable(value.replies, comment_thread_replies.to_json)),
      #("snippet", json.nullable(value.snippet, comment_thread_snippet.to_json)),
    ],
  )
}