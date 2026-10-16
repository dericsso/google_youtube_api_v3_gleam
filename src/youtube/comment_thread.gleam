//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/comment_thread_replies.{type CommentThreadReplies}
import youtube/comment_thread_snippet.{type CommentThreadSnippet}

/// A *comment thread* represents information that applies to a top level comment and all its replies. It can also include the top level comment itself and some of the replies.
pub type CommentThread {
  CommentThread(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    replies: option.Option(CommentThreadReplies),
    snippet: option.Option(CommentThreadSnippet),
  )
}

pub fn decoder() -> Decoder(CommentThread) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use replies <- optional_field(
    "replies",
    option.None,
    optional(comment_thread_replies.decoder()),
  )
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(comment_thread_snippet.decoder()),
  )
  success(CommentThread(etag, id, kind, replies, snippet))
}