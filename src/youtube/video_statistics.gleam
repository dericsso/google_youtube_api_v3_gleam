//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
