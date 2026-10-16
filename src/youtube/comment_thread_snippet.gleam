//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/comment.{type Comment}

/// Basic details about a comment thread.
pub type CommentThreadSnippet {
  CommentThreadSnippet(
    can_reply: option.Option(Bool),
    channel_id: option.Option(String),
    is_public: option.Option(Bool),
    top_level_comment: option.Option(Comment),
    total_reply_count: option.Option(Int),
    video_id: option.Option(String),
  )
}
