//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Freebase topic information related to the channel.
pub type ChannelTopicDetails {
  ChannelTopicDetails(
    topic_categories: Option(List(String)),
    topic_ids: Option(List(String)),
  )
}

pub fn decoder() -> Decoder(ChannelTopicDetails) {
  use topic_categories <- decode.optional_field(
    "topicCategories",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use topic_ids <- decode.optional_field(
    "topicIds",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  decode.success(ChannelTopicDetails(topic_categories, topic_ids))
}

pub fn to_json(value: ChannelTopicDetails) -> Json {
  json.object([
    #(
      "topicCategories",
      json.nullable(value.topic_categories, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "topicIds",
      json.nullable(value.topic_ids, fn(items) {
        json.array(items, json.string)
      }),
    ),
  ])
}
