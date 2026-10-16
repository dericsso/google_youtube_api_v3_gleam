//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Statistics about the video, such as the number of times the video was viewed or liked.
pub type VideoStatsStatistics {
  VideoStatsStatistics(
    comment_count: option.Option(String),
    like_count: option.Option(String),
    view_count: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoStatsStatistics) {
  use comment_count <- optional_field(
    "commentCount",
    option.None,
    optional(string),
  )
  use like_count <- optional_field("likeCount", option.None, optional(string))
  use view_count <- optional_field("viewCount", option.None, optional(string))
  success(VideoStatsStatistics(comment_count, like_count, view_count))
}