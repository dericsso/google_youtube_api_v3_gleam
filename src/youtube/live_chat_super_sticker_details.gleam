//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
