//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Statistics about the video, such as the number of times the video was viewed or liked.
pub type VideoStatistics {
  VideoStatistics(
    comment_count: Option(String),
    dislike_count: Option(String),
    favorite_count: Option(String),
    like_count: Option(String),
    view_count: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoStatistics) {
  use comment_count <- decode.optional_field(
    "commentCount",
    option.None,
    decode.optional(decode.string),
  )
  use dislike_count <- decode.optional_field(
    "dislikeCount",
    option.None,
    decode.optional(decode.string),
  )
  use favorite_count <- decode.optional_field(
    "favoriteCount",
    option.None,
    decode.optional(decode.string),
  )
  use like_count <- decode.optional_field(
    "likeCount",
    option.None,
    decode.optional(decode.string),
  )
  use view_count <- decode.optional_field(
    "viewCount",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(VideoStatistics(
    comment_count,
    dislike_count,
    favorite_count,
    like_count,
    view_count,
  ))
}

pub fn to_json(value: VideoStatistics) -> Json {
  json.object([
    #("commentCount", json.nullable(value.comment_count, json.string)),
    #("dislikeCount", json.nullable(value.dislike_count, json.string)),
    #("favoriteCount", json.nullable(value.favorite_count, json.string)),
    #("likeCount", json.nullable(value.like_count, json.string)),
    #("viewCount", json.nullable(value.view_count, json.string)),
  ])
}
