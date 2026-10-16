//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option

/// Freebase topic information related to the video.
pub type VideoTopicDetails {
  VideoTopicDetails(
    relevant_topic_ids: option.Option(List(String)),
    topic_categories: option.Option(List(String)),
    topic_ids: option.Option(List(String)),
  )
}

pub fn decoder() -> Decoder(VideoTopicDetails) {
  use relevant_topic_ids <- optional_field(
    "relevantTopicIds",
    option.None,
    optional(list(string)),
  )
  use topic_categories <- optional_field(
    "topicCategories",
    option.None,
    optional(list(string)),
  )
  use topic_ids <- optional_field(
    "topicIds",
    option.None,
    optional(list(string)),
  )
  success(VideoTopicDetails(relevant_topic_ids, topic_categories, topic_ids))
}