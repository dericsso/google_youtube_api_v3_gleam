//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Freebase topic information related to the channel.
pub type ChannelTopicDetails {
  ChannelTopicDetails(
    topic_categories: option.Option(List(String)),
    topic_ids: option.Option(List(String)),
  )
}
