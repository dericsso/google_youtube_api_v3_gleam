//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success}
import gleam/option
import youtube/live_chat_poll_details_poll_metadata_poll_option.{type LiveChatPollDetailsPollMetadataPollOption}

pub type LiveChatPollDetailsPollMetadata {
  LiveChatPollDetailsPollMetadata(
    options: option.Option(List(LiveChatPollDetailsPollMetadataPollOption)),
    question_text: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatPollDetailsPollMetadata) {
  use options <- optional_field(
    "options",
    option.None,
    optional(list(live_chat_poll_details_poll_metadata_poll_option.decoder())),
  )
  use question_text <- optional_field(
    "questionText",
    option.None,
    optional(string),
  )
  success(LiveChatPollDetailsPollMetadata(options, question_text))
}