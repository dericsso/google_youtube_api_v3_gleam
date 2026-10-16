//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_chat_poll_details_poll_metadata_poll_option.{
  type LiveChatPollDetailsPollMetadataPollOption,
}

pub type LiveChatPollDetailsPollMetadata {
  LiveChatPollDetailsPollMetadata(
    options: option.Option(List(LiveChatPollDetailsPollMetadataPollOption)),
    question_text: option.Option(String),
  )
}
