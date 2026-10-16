//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/resource_id.{type ResourceId}

/// Details about a resource which was added to a channel.
pub type ActivityContentDetailsChannelItem {
  ActivityContentDetailsChannelItem(resource_id: option.Option(ResourceId))
}
