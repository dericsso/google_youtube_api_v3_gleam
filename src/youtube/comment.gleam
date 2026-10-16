//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
