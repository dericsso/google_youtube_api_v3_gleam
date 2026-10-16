//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/resource_id.{type ResourceId}

/// Details about a channel bulletin post.
pub type ActivityContentDetailsBulletin {
  ActivityContentDetailsBulletin(resource_id: option.Option(ResourceId))
}

pub fn decoder() -> Decoder(ActivityContentDetailsBulletin) {
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  success(ActivityContentDetailsBulletin(resource_id))
}