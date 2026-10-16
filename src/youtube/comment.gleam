//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/comment_snippet.{type CommentSnippet}

/// A *comment* represents a single YouTube comment.
pub type Comment {
  Comment(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(CommentSnippet),
  )
}

pub fn decoder() -> Decoder(Comment) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(comment_snippet.decoder()),
  )
  success(Comment(etag, id, kind, snippet))
}