//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic details about an activity, including title, description, thumbnails, activity type and group. Next ID: 12
pub type ActivitySnippet {
  ActivitySnippet(
    channel_id: option.Option(String),
    channel_title: option.Option(String),
    description: option.Option(String),
    group_id: option.Option(String),
    published_at: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
    type_: option.Option(String),
  )
}
