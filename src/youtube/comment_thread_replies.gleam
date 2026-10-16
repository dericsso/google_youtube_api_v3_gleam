//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/comment.{type Comment}

/// Comments written in (direct or indirect) reply to the top level comment.
pub type CommentThreadReplies {
  CommentThreadReplies(comments: option.Option(List(Comment)))
}
