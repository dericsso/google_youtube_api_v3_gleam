//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/resource_id.{type ResourceId}
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a subscription, including title, description and thumbnails of the subscribed item.
pub type SubscriptionSnippet {
  SubscriptionSnippet(
    channel_id: option.Option(String),
    description: option.Option(String),
    published_at: option.Option(String),
    resource_id: option.Option(ResourceId),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}
