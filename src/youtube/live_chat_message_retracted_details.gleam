//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LiveChatMessageRetractedDetails {
  LiveChatMessageRetractedDetails(retracted_message_id: option.Option(String))
}

pub fn decoder() -> Decoder(LiveChatMessageRetractedDetails) {
  use retracted_message_id <- optional_field(
    "retractedMessageId",
    option.None,
    optional(string),
  )
  success(LiveChatMessageRetractedDetails(retracted_message_id))
}