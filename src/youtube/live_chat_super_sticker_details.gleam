//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/super_sticker_metadata.{type SuperStickerMetadata}

pub type LiveChatSuperStickerDetails {
  LiveChatSuperStickerDetails(
    amount_display_string: Option(String),
    amount_micros: Option(String),
    currency: Option(String),
    super_sticker_metadata: Option(SuperStickerMetadata),
    tier: Option(Int),
  )
}

pub fn decoder() -> Decoder(LiveChatSuperStickerDetails) {
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
  use super_sticker_metadata <- decode.optional_field(
    "superStickerMetadata",
    option.None,
    decode.optional(super_sticker_metadata.decoder()),
  )
  use tier <- decode.optional_field(
    "tier",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(LiveChatSuperStickerDetails(
    amount_display_string,
    amount_micros,
    currency,
    super_sticker_metadata,
    tier,
  ))
}

pub fn to_json(value: LiveChatSuperStickerDetails) -> Json {
  json.object([
    #(
      "amountDisplayString",
      json.nullable(value.amount_display_string, json.string),
    ),
    #("amountMicros", json.nullable(value.amount_micros, json.string)),
    #("currency", json.nullable(value.currency, json.string)),
    #(
      "superStickerMetadata",
      json.nullable(
        value.super_sticker_metadata,
        super_sticker_metadata.to_json,
      ),
    ),
    #("tier", json.nullable(value.tier, json.int)),
  ])
}
