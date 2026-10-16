//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}

/// Information about a channel that a user subscribed to.
pub type ActivityContentDetailsSubscription {
  ActivityContentDetailsSubscription(resource_id: Option(ResourceId))
}

pub fn decoder() -> Decoder(ActivityContentDetailsSubscription) {
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  decode.success(ActivityContentDetailsSubscription(resource_id))
}

pub fn to_json(value: ActivityContentDetailsSubscription) -> Json {
  json.object([
    #("resourceId", json.nullable(value.resource_id, resource_id.to_json)),
  ])
}
