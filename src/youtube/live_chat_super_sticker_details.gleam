//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
import gleam/option
import youtube/super_sticker_metadata.{type SuperStickerMetadata}

pub type LiveChatSuperStickerDetails {
  LiveChatSuperStickerDetails(
    amount_display_string: option.Option(String),
    amount_micros: option.Option(String),
    currency: option.Option(String),
    super_sticker_metadata: option.Option(SuperStickerMetadata),
    tier: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(LiveChatSuperStickerDetails) {
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
  use super_sticker_metadata <- optional_field(
    "superStickerMetadata",
    option.None,
    optional(super_sticker_metadata.decoder()),
  )
  use tier <- optional_field("tier", option.None, optional(int))
  success(
    LiveChatSuperStickerDetails(
      amount_display_string,
      amount_micros,
      currency,
      super_sticker_metadata,
      tier,
    ),
  )
}