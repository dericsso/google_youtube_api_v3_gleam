//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Statistics about the video, such as the number of times the video was viewed or liked.
pub type VideoStatsStatistics {
  VideoStatsStatistics(
    comment_count: option.Option(String),
    like_count: option.Option(String),
    view_count: option.Option(String),
  )
}
