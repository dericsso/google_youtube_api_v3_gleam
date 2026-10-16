//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
