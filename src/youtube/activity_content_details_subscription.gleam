//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/resource_id.{type ResourceId}

/// Information about a channel that a user subscribed to.
pub type ActivityContentDetailsSubscription {
  ActivityContentDetailsSubscription(resource_id: option.Option(ResourceId))
}

pub fn decoder() -> Decoder(ActivityContentDetailsSubscription) {
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  success(ActivityContentDetailsSubscription(resource_id))
}