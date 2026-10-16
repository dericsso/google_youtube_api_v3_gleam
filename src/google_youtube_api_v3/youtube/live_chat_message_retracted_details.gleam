//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatMessageRetractedDetails {
  LiveChatMessageRetractedDetails(retracted_message_id: Option(String))
}

pub fn decoder() -> Decoder(LiveChatMessageRetractedDetails) {
  use retracted_message_id <- decode.optional_field(
    "retractedMessageId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMessageRetractedDetails(retracted_message_id))
}

pub fn to_json(value: LiveChatMessageRetractedDetails) -> Json {
  json.object([
    #(
      "retractedMessageId",
      json.nullable(value.retracted_message_id, json.string),
    ),
  ])
}
