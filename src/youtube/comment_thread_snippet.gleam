//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, bool, success}
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

pub fn decoder() -> Decoder(CommentThreadSnippet) {
  use can_reply <- optional_field("canReply", option.None, optional(bool))
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use is_public <- optional_field("isPublic", option.None, optional(bool))
  use top_level_comment <- optional_field(
    "topLevelComment",
    option.None,
    optional(comment.decoder()),
  )
  use total_reply_count <- optional_field(
    "totalReplyCount",
    option.None,
    optional(int),
  )
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(
    CommentThreadSnippet(
      can_reply,
      channel_id,
      is_public,
      top_level_comment,
      total_reply_count,
      video_id,
    ),
  )
}