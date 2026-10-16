//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/thumbnail_details.{type ThumbnailDetails}

/// Basic broadcast information.
pub type LiveBroadcastSnippet {
  LiveBroadcastSnippet(
    actual_end_time: option.Option(String),
    actual_start_time: option.Option(String),
    category_id: option.Option(String),
    channel_id: option.Option(String),
    description: option.Option(String),
    is_default_broadcast: option.Option(Bool),
    live_chat_id: option.Option(String),
    published_at: option.Option(String),
    scheduled_end_time: option.Option(String),
    scheduled_start_time: option.Option(String),
    thumbnails: option.Option(ThumbnailDetails),
    title: option.Option(String),
  )
}
