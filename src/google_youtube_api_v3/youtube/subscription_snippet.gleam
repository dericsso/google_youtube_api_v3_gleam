//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}
import google_youtube_api_v3/youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a subscription, including title, description and thumbnails of the subscribed item.
pub type SubscriptionSnippet {
  SubscriptionSnippet(
    channel_id: Option(String),
    description: Option(String),
    published_at: Option(String),
    resource_id: Option(ResourceId),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn decoder() -> Decoder(SubscriptionSnippet) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use published_at <- decode.optional_field(
    "publishedAt",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  use thumbnails <- decode.optional_field(
    "thumbnails",
    option.None,
    decode.optional(thumbnail_details.decoder()),
  )
  use title <- decode.optional_field(
    "title",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(SubscriptionSnippet(
    channel_id,
    description,
    published_at,
    resource_id,
    thumbnails,
    title,
  ))
}

pub fn to_json(value: SubscriptionSnippet) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #("publishedAt", json.nullable(value.published_at, json.string)),
    #("resourceId", json.nullable(value.resource_id, resource_id.to_json)),
    #("thumbnails", json.nullable(value.thumbnails, thumbnail_details.to_json)),
    #("title", json.nullable(value.title, json.string)),
  ])
}
