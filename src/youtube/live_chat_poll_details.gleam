//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_chat_poll_details_poll_metadata.{
  type LiveChatPollDetailsPollMetadata,
}

pub type LiveChatPollDetails {
  LiveChatPollDetails(
    metadata: option.Option(LiveChatPollDetailsPollMetadata),
    status: option.Option(String),
  )
}
