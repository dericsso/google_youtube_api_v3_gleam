//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatPollDetailsPollMetadataPollOption {
  LiveChatPollDetailsPollMetadataPollOption(
    option_text: Option(String),
    tally: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatPollDetailsPollMetadataPollOption) {
  use option_text <- decode.optional_field(
    "optionText",
    option.None,
    decode.optional(decode.string),
  )
  use tally <- decode.optional_field(
    "tally",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatPollDetailsPollMetadataPollOption(option_text, tally))
}

pub fn to_json(value: LiveChatPollDetailsPollMetadataPollOption) -> Json {
  json.object(
    [
      #("optionText", json.nullable(value.option_text, json.string)),
      #("tally", json.nullable(value.tally, json.string)),
    ],
  )
}