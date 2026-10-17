//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatTextMessageDetails {
  LiveChatTextMessageDetails(message_text: Option(String))
}

pub fn decoder() -> Decoder(LiveChatTextMessageDetails) {
  use message_text <- decode.optional_field(
    "messageText",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatTextMessageDetails(message_text))
}

pub fn to_json(value: LiveChatTextMessageDetails) -> Json {
  json.object(
    [#("messageText", json.nullable(value.message_text, json.string))],
  )
}