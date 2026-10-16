//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LiveChatPollDetailsPollMetadataPollOption {
  LiveChatPollDetailsPollMetadataPollOption(
    option_text: option.Option(String),
    tally: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatPollDetailsPollMetadataPollOption) {
  use option_text <- optional_field("optionText", option.None, optional(string))
  use tally <- optional_field("tally", option.None, optional(string))
  success(LiveChatPollDetailsPollMetadataPollOption(option_text, tally))
}