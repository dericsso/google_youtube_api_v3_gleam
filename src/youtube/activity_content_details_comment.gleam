//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/resource_id.{type ResourceId}

/// Information about a resource that received a comment.
pub type ActivityContentDetailsComment {
  ActivityContentDetailsComment(resource_id: option.Option(ResourceId))
}

pub fn decoder() -> Decoder(ActivityContentDetailsComment) {
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  success(ActivityContentDetailsComment(resource_id))
}