//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Statistics about the video, such as the number of times the video was viewed or liked.
pub type VideoStatsStatistics {
  VideoStatsStatistics(
    comment_count: Option(String),
    like_count: Option(String),
    view_count: Option(String),
  )
}

pub fn decoder() -> Decoder(VideoStatsStatistics) {
  use comment_count <- decode.optional_field(
    "commentCount",
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
  decode.success(VideoStatsStatistics(comment_count, like_count, view_count))
}

pub fn to_json(value: VideoStatsStatistics) -> Json {
  json.object(
    [
      #("commentCount", json.nullable(value.comment_count, json.string)),
      #("likeCount", json.nullable(value.like_count, json.string)),
      #("viewCount", json.nullable(value.view_count, json.string)),
    ],
  )
}