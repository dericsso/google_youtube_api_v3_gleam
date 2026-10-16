//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/access_policy.{type AccessPolicy}
import youtube/content_rating.{type ContentRating}
import youtube/video_content_details_region_restriction.{
  type VideoContentDetailsRegionRestriction,
}

/// Details about the content of a YouTube Video.
pub type VideoContentDetails {
  VideoContentDetails(
    caption: option.Option(String),
    content_rating: option.Option(ContentRating),
    country_restriction: option.Option(AccessPolicy),
    definition: option.Option(String),
    dimension: option.Option(String),
    duration: option.Option(String),
    has_custom_thumbnail: option.Option(Bool),
    licensed_content: option.Option(Bool),
    projection: option.Option(String),
    region_restriction: option.Option(VideoContentDetailsRegionRestriction),
  )
}
