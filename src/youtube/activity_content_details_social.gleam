//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/resource_id.{type ResourceId}

/// Details about a social network post.
pub type ActivityContentDetailsSocial {
  ActivityContentDetailsSocial(
    author: option.Option(String),
    image_url: option.Option(String),
    reference_url: option.Option(String),
    resource_id: option.Option(ResourceId),
    type_: option.Option(String),
  )
}
