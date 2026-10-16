//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, success}
import gleam/option
import youtube/resource_id.{type ResourceId}

/// Details about a resource which was added to a channel.
pub type ActivityContentDetailsChannelItem {
  ActivityContentDetailsChannelItem(resource_id: option.Option(ResourceId))
}

pub fn decoder() -> Decoder(ActivityContentDetailsChannelItem) {
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  success(ActivityContentDetailsChannelItem(resource_id))
}