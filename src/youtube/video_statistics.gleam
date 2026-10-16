//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

/// Statistics about the video, such as the number of times the video was viewed or liked.
pub type VideoStatistics {
  VideoStatistics(
    comment_count: option.Option(String),
    dislike_count: option.Option(String),
    favorite_count: option.Option(String),
    like_count: option.Option(String),
    view_count: option.Option(String),
  )
}

pub fn decoder() -> Decoder(VideoStatistics) {
  use comment_count <- optional_field(
    "commentCount",
    option.None,
    optional(string),
  )
  use dislike_count <- optional_field(
    "dislikeCount",
    option.None,
    optional(string),
  )
  use favorite_count <- optional_field(
    "favoriteCount",
    option.None,
    optional(string),
  )
  use like_count <- optional_field("likeCount", option.None, optional(string))
  use view_count <- optional_field("viewCount", option.None, optional(string))
  success(
    VideoStatistics(
      comment_count,
      dislike_count,
      favorite_count,
      like_count,
      view_count,
    ),
  )
}