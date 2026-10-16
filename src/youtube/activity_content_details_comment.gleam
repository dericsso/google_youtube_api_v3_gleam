//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/resource_id.{type ResourceId}

/// Information about a resource that received a comment.
pub type ActivityContentDetailsComment {
  ActivityContentDetailsComment(resource_id: option.Option(ResourceId))
}
