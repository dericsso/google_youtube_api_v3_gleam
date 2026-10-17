//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Statistics about a channel: number of subscribers, number of videos in the channel, etc.
pub type ChannelStatistics {
  ChannelStatistics(
    comment_count: Option(String),
    hidden_subscriber_count: Option(Bool),
    subscriber_count: Option(String),
    video_count: Option(String),
    view_count: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelStatistics) {
  use comment_count <- decode.optional_field(
    "commentCount",
    option.None,
    decode.optional(decode.string),
  )
  use hidden_subscriber_count <- decode.optional_field(
    "hiddenSubscriberCount",
    option.None,
    decode.optional(decode.bool),
  )
  use subscriber_count <- decode.optional_field(
    "subscriberCount",
    option.None,
    decode.optional(decode.string),
  )
  use video_count <- decode.optional_field(
    "videoCount",
    option.None,
    decode.optional(decode.string),
  )
  use view_count <- decode.optional_field(
    "viewCount",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    ChannelStatistics(
      comment_count,
      hidden_subscriber_count,
      subscriber_count,
      video_count,
      view_count,
    ),
  )
}

pub fn to_json(value: ChannelStatistics) -> Json {
  json.object(
    [
      #("commentCount", json.nullable(value.comment_count, json.string)),
      #(
        "hiddenSubscriberCount",
        json.nullable(value.hidden_subscriber_count, json.bool),
      ),
      #("subscriberCount", json.nullable(value.subscriber_count, json.string)),
      #("videoCount", json.nullable(value.video_count, json.string)),
      #("viewCount", json.nullable(value.view_count, json.string)),
    ],
  )
}