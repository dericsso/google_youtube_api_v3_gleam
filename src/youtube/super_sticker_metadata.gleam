//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type SuperStickerMetadata {
  SuperStickerMetadata(
    alt_text: Option(String),
    alt_text_language: Option(String),
    sticker_id: Option(String),
  )
}

pub fn decoder() -> Decoder(SuperStickerMetadata) {
  use alt_text <- decode.optional_field(
    "altText",
    option.None,
    decode.optional(decode.string),
  )
  use alt_text_language <- decode.optional_field(
    "altTextLanguage",
    option.None,
    decode.optional(decode.string),
  )
  use sticker_id <- decode.optional_field(
    "stickerId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(SuperStickerMetadata(alt_text, alt_text_language, sticker_id))
}

pub fn to_json(value: SuperStickerMetadata) -> Json {
  json.object([
    #("altText", json.nullable(value.alt_text, json.string)),
    #("altTextLanguage", json.nullable(value.alt_text_language, json.string)),
    #("stickerId", json.nullable(value.sticker_id, json.string)),
  ])
}
