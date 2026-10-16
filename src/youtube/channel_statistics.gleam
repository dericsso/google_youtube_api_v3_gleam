//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Statistics about a channel: number of subscribers, number of videos in the channel, etc.
pub type ChannelStatistics {
  ChannelStatistics(
    comment_count: option.Option(String),
    hidden_subscriber_count: option.Option(Bool),
    subscriber_count: option.Option(String),
    video_count: option.Option(String),
    view_count: option.Option(String),
  )
}
