//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/live_chat_poll_details_poll_metadata_poll_option.{
  type LiveChatPollDetailsPollMetadataPollOption,
}

pub type LiveChatPollDetailsPollMetadata {
  LiveChatPollDetailsPollMetadata(
    options: Option(List(LiveChatPollDetailsPollMetadataPollOption)),
    question_text: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatPollDetailsPollMetadata) {
  use options <- decode.optional_field(
    "options",
    option.None,
    decode.optional(
      decode.list(live_chat_poll_details_poll_metadata_poll_option.decoder()),
    ),
  )
  use question_text <- decode.optional_field(
    "questionText",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatPollDetailsPollMetadata(options, question_text))
}

pub fn to_json(value: LiveChatPollDetailsPollMetadata) -> Json {
  json.object([
    #(
      "options",
      json.nullable(value.options, fn(items) {
        json.array(
          items,
          live_chat_poll_details_poll_metadata_poll_option.to_json,
        )
      }),
    ),
    #("questionText", json.nullable(value.question_text, json.string)),
  ])
}
