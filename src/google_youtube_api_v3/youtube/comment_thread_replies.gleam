//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/comment.{type Comment}

/// Comments written in (direct or indirect) reply to the top level comment.
pub type CommentThreadReplies {
  CommentThreadReplies(comments: Option(List(Comment)))
}

pub fn decoder() -> Decoder(CommentThreadReplies) {
  use comments <- decode.optional_field(
    "comments",
    option.None,
    decode.optional(decode.list(comment.decoder())),
  )
  decode.success(CommentThreadReplies(comments))
}

pub fn to_json(value: CommentThreadReplies) -> Json {
  json.object([
    #(
      "comments",
      json.nullable(value.comments, fn(items) {
        json.array(items, comment.to_json)
      }),
    ),
  ])
}
