//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about the gift event, this is only set if the type is `giftEvent`.
pub type LiveChatGiftDetails {
  LiveChatGiftDetails(
    alt_text: Option(String),
    combo_count: Option(Int),
    gift_duration: Option(String),
    gift_name: Option(String),
    gift_url: Option(String),
    has_visual_effect: Option(Bool),
    jewels_amount: Option(Int),
    language: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatGiftDetails) {
  use alt_text <- decode.optional_field(
    "altText",
    option.None,
    decode.optional(decode.string),
  )
  use combo_count <- decode.optional_field(
    "comboCount",
    option.None,
    decode.optional(decode.int),
  )
  use gift_duration <- decode.optional_field(
    "giftDuration",
    option.None,
    decode.optional(decode.string),
  )
  use gift_name <- decode.optional_field(
    "giftName",
    option.None,
    decode.optional(decode.string),
  )
  use gift_url <- decode.optional_field(
    "giftUrl",
    option.None,
    decode.optional(decode.string),
  )
  use has_visual_effect <- decode.optional_field(
    "hasVisualEffect",
    option.None,
    decode.optional(decode.bool),
  )
  use jewels_amount <- decode.optional_field(
    "jewelsAmount",
    option.None,
    decode.optional(decode.int),
  )
  use language <- decode.optional_field(
    "language",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    LiveChatGiftDetails(
      alt_text,
      combo_count,
      gift_duration,
      gift_name,
      gift_url,
      has_visual_effect,
      jewels_amount,
      language,
    ),
  )
}

pub fn to_json(value: LiveChatGiftDetails) -> Json {
  json.object(
    [
      #("altText", json.nullable(value.alt_text, json.string)),
      #("comboCount", json.nullable(value.combo_count, json.int)),
      #("giftDuration", json.nullable(value.gift_duration, json.string)),
      #("giftName", json.nullable(value.gift_name, json.string)),
      #("giftUrl", json.nullable(value.gift_url, json.string)),
      #("hasVisualEffect", json.nullable(value.has_visual_effect, json.bool)),
      #("jewelsAmount", json.nullable(value.jewels_amount, json.int)),
      #("language", json.nullable(value.language, json.string)),
    ],
  )
}