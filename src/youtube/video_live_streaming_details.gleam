//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Details about the live streaming metadata.
pub type VideoLiveStreamingDetails {
  VideoLiveStreamingDetails(
    active_live_chat_id: option.Option(String),
    actual_end_time: option.Option(String),
    actual_start_time: option.Option(String),
    concurrent_viewers: option.Option(String),
    scheduled_end_time: option.Option(String),
    scheduled_start_time: option.Option(String),
  )
}
