//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/video_stat.{type VideoStat}

/// Response for the Videos.stats API. Returns VideoStat information about a batch of videos. VideoStat contains a subset of the information in Video that is relevant to statistics and content details. BatchGetStats is intentionally not atomic to provide a better user experience. BatchGetStatsResponse returns a summary to help users understand the outcome of the operation.
pub type BatchGetStatsResponse {
  BatchGetStatsResponse(
    etag: option.Option(String),
    items: option.Option(List(VideoStat)),
    kind: option.Option(String),
  )
}
