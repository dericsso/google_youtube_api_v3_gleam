//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/resource_id.{type ResourceId}

/// Information about a channel that a user subscribed to.
pub type ActivityContentDetailsSubscription {
  ActivityContentDetailsSubscription(resource_id: option.Option(ResourceId))
}
