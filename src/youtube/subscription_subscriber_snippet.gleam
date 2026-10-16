//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about a subscription's subscriber including title, description, channel ID and thumbnails.
pub type SubscriptionSubscriberSnippet {
  SubscriptionSubscriberSnippet(
    channel_id: Option(String),
    description: Option(String),
    thumbnails: Option(ThumbnailDetails),
    title: Option(String),
  )
}

pub fn decoder() -> Decoder(SubscriptionSubscriberSnippet) {
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
  decode.success(SubscriptionSubscriberSnippet(
    channel_id,
    description,
    thumbnails,
    title,
  ))
}

pub fn to_json(value: SubscriptionSubscriberSnippet) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("description", json.nullable(value.description, json.string)),
    #("thumbnails", json.nullable(value.thumbnails, thumbnail_details.to_json)),
    #("title", json.nullable(value.title, json.string)),
  ])
}
