//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, list, success}
import gleam/option
import youtube/comment.{type Comment}

/// Comments written in (direct or indirect) reply to the top level comment.
pub type CommentThreadReplies {
  CommentThreadReplies(comments: option.Option(List(Comment)))
}

pub fn decoder() -> Decoder(CommentThreadReplies) {
  use comments <- optional_field(
    "comments",
    option.None,
    optional(list(comment.decoder())),
  )
  success(CommentThreadReplies(comments))
}