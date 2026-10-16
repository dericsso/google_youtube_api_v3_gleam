//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
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

pub fn decoder() -> Decoder(SubscriptionSnippet) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use published_at <- optional_field(
    "publishedAt",
    option.None,
    optional(string),
  )
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  use thumbnails <- optional_field(
    "thumbnails",
    option.None,
    optional(thumbnail_details.decoder()),
  )
  use title <- optional_field("title", option.None, optional(string))
  success(
    SubscriptionSnippet(
      channel_id,
      description,
      published_at,
      resource_id,
      thumbnails,
      title,
    ),
  )
}