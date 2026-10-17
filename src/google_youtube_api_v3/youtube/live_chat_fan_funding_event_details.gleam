//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatFanFundingEventDetails {
  LiveChatFanFundingEventDetails(
    amount_display_string: Option(String),
    amount_micros: Option(String),
    currency: Option(String),
    user_comment: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatFanFundingEventDetails) {
  use amount_display_string <- decode.optional_field(
    "amountDisplayString",
    option.None,
    decode.optional(decode.string),
  )
  use amount_micros <- decode.optional_field(
    "amountMicros",
    option.None,
    decode.optional(decode.string),
  )
  use currency <- decode.optional_field(
    "currency",
    option.None,
    decode.optional(decode.string),
  )
  use user_comment <- decode.optional_field(
    "userComment",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    LiveChatFanFundingEventDetails(
      amount_display_string,
      amount_micros,
      currency,
      user_comment,
    ),
  )
}

pub fn to_json(value: LiveChatFanFundingEventDetails) -> Json {
  json.object(
    [
      #(
        "amountDisplayString",
        json.nullable(value.amount_display_string, json.string),
      ),
      #("amountMicros", json.nullable(value.amount_micros, json.string)),
      #("currency", json.nullable(value.currency, json.string)),
      #("userComment", json.nullable(value.user_comment, json.string)),
    ],
  )
}