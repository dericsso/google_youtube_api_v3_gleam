//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
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

pub fn decoder() -> Decoder(ChannelStatistics) {
  use comment_count <- optional_field(
    "commentCount",
    option.None,
    optional(string),
  )
  use hidden_subscriber_count <- optional_field(
    "hiddenSubscriberCount",
    option.None,
    optional(bool),
  )
  use subscriber_count <- optional_field(
    "subscriberCount",
    option.None,
    optional(string),
  )
  use video_count <- optional_field("videoCount", option.None, optional(string))
  use view_count <- optional_field("viewCount", option.None, optional(string))
  success(
    ChannelStatistics(
      comment_count,
      hidden_subscriber_count,
      subscriber_count,
      video_count,
      view_count,
    ),
  )
}