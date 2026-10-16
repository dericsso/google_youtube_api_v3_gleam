//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LiveChatMessageDeletedDetails {
  LiveChatMessageDeletedDetails(deleted_message_id: option.Option(String))
}

pub fn decoder() -> Decoder(LiveChatMessageDeletedDetails) {
  use deleted_message_id <- optional_field(
    "deletedMessageId",
    option.None,
    optional(string),
  )
  success(LiveChatMessageDeletedDetails(deleted_message_id))
}