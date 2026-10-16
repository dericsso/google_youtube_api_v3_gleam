//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type SuperStickerMetadata {
  SuperStickerMetadata(
    alt_text: option.Option(String),
    alt_text_language: option.Option(String),
    sticker_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(SuperStickerMetadata) {
  use alt_text <- optional_field("altText", option.None, optional(string))
  use alt_text_language <- optional_field(
    "altTextLanguage",
    option.None,
    optional(string),
  )
  use sticker_id <- optional_field("stickerId", option.None, optional(string))
  success(SuperStickerMetadata(alt_text, alt_text_language, sticker_id))
}