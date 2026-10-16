//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LiveChatFanFundingEventDetails {
  LiveChatFanFundingEventDetails(
    amount_display_string: option.Option(String),
    amount_micros: option.Option(String),
    currency: option.Option(String),
    user_comment: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatFanFundingEventDetails) {
  use amount_display_string <- optional_field(
    "amountDisplayString",
    option.None,
    optional(string),
  )
  use amount_micros <- optional_field(
    "amountMicros",
    option.None,
    optional(string),
  )
  use currency <- optional_field("currency", option.None, optional(string))
  use user_comment <- optional_field(
    "userComment",
    option.None,
    optional(string),
  )
  success(
    LiveChatFanFundingEventDetails(
      amount_display_string,
      amount_micros,
      currency,
      user_comment,
    ),
  )
}