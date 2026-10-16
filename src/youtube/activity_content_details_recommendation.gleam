//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/resource_id.{type ResourceId}

/// Information that identifies the recommended resource.
pub type ActivityContentDetailsRecommendation {
  ActivityContentDetailsRecommendation(
    reason: option.Option(String),
    resource_id: option.Option(ResourceId),
    seed_resource_id: option.Option(ResourceId),
  )
}
