//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatSuperChatDetails {
  LiveChatSuperChatDetails(
    amount_display_string: Option(String),
    amount_micros: Option(String),
    currency: Option(String),
    tier: Option(Int),
    user_comment: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatSuperChatDetails) {
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
  use tier <- decode.optional_field(
    "tier",
    option.None,
    decode.optional(decode.int),
  )
  use user_comment <- decode.optional_field(
    "userComment",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    LiveChatSuperChatDetails(
      amount_display_string,
      amount_micros,
      currency,
      tier,
      user_comment,
    ),
  )
}

pub fn to_json(value: LiveChatSuperChatDetails) -> Json {
  json.object(
    [
      #(
        "amountDisplayString",
        json.nullable(value.amount_display_string, json.string),
      ),
      #("amountMicros", json.nullable(value.amount_micros, json.string)),
      #("currency", json.nullable(value.currency, json.string)),
      #("tier", json.nullable(value.tier, json.int)),
      #("userComment", json.nullable(value.user_comment, json.string)),
    ],
  )
}