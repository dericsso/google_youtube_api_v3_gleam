//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LiveChatTextMessageDetails {
  LiveChatTextMessageDetails(message_text: option.Option(String))
}

pub fn decoder() -> Decoder(LiveChatTextMessageDetails) {
  use message_text <- optional_field(
    "messageText",
    option.None,
    optional(string),
  )
  success(LiveChatTextMessageDetails(message_text))
}