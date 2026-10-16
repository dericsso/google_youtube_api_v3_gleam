//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatMessageDeletedDetails {
  LiveChatMessageDeletedDetails(deleted_message_id: Option(String))
}

pub fn decoder() -> Decoder(LiveChatMessageDeletedDetails) {
  use deleted_message_id <- decode.optional_field(
    "deletedMessageId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMessageDeletedDetails(deleted_message_id))
}

pub fn to_json(value: LiveChatMessageDeletedDetails) -> Json {
  json.object([
    #("deletedMessageId", json.nullable(value.deleted_message_id, json.string)),
  ])
}
