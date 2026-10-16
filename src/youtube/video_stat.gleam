//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_stats_content_details.{type VideoStatsContentDetails}
import youtube/video_stats_snippet.{type VideoStatsSnippet}
import youtube/video_stats_statistics.{type VideoStatsStatistics}

/// A *VideoStat* resource represents a YouTube video's stats.
pub type VideoStat {
  VideoStat(
    content_details: option.Option(VideoStatsContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(VideoStatsSnippet),
    statistics: option.Option(VideoStatsStatistics),
  )
}
