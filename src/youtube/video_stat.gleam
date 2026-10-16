//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
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

pub fn decoder() -> Decoder(VideoStat) {
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(video_stats_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(video_stats_snippet.decoder()),
  )
  use statistics <- optional_field(
    "statistics",
    option.None,
    optional(video_stats_statistics.decoder()),
  )
  success(VideoStat(content_details, etag, id, kind, snippet, statistics))
}