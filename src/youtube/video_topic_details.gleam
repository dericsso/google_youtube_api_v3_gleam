//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Freebase topic information related to the video.
pub type VideoTopicDetails {
  VideoTopicDetails(
    relevant_topic_ids: option.Option(List(String)),
    topic_categories: option.Option(List(String)),
    topic_ids: option.Option(List(String)),
  )
}
