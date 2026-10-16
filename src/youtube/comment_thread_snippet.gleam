//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/comment.{type Comment}

/// Basic details about a comment thread.
pub type CommentThreadSnippet {
  CommentThreadSnippet(
    can_reply: Option(Bool),
    channel_id: Option(String),
    is_public: Option(Bool),
    top_level_comment: Option(Comment),
    total_reply_count: Option(Int),
    video_id: Option(String),
  )
}

pub fn decoder() -> Decoder(CommentThreadSnippet) {
  use can_reply <- decode.optional_field(
    "canReply",
    option.None,
    decode.optional(decode.bool),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use is_public <- decode.optional_field(
    "isPublic",
    option.None,
    decode.optional(decode.bool),
  )
  use top_level_comment <- decode.optional_field(
    "topLevelComment",
    option.None,
    decode.optional(comment.decoder()),
  )
  use total_reply_count <- decode.optional_field(
    "totalReplyCount",
    option.None,
    decode.optional(decode.int),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(CommentThreadSnippet(
    can_reply,
    channel_id,
    is_public,
    top_level_comment,
    total_reply_count,
    video_id,
  ))
}

pub fn to_json(value: CommentThreadSnippet) -> Json {
  json.object([
    #("canReply", json.nullable(value.can_reply, json.bool)),
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("isPublic", json.nullable(value.is_public, json.bool)),
    #(
      "topLevelComment",
      json.nullable(value.top_level_comment, comment.to_json),
    ),
    #("totalReplyCount", json.nullable(value.total_reply_count, json.int)),
    #("videoId", json.nullable(value.video_id, json.string)),
  ])
}
