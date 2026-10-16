//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a subscription's subscriber including title, description, channel ID and thumbnails.
pub type SubscriptionSubscriberSnippet {
  SubscriptionSubscriberSnippet(
    channel_id: option.Option(String),
    description: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}

pub fn decoder() -> Decoder(SubscriptionSubscriberSnippet) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use thumbnails <- optional_field(
    "thumbnails",
    option.None,
    optional(thumbnail_details.decoder()),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(
    SubscriptionSubscriberSnippet(channel_id, description, thumbnails, title),
  )
}