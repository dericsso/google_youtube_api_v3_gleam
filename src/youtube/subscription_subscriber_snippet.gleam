//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
