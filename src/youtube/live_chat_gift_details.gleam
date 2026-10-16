//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, bool, success}
import gleam/option

/// Details about the gift event, this is only set if the type is `giftEvent`.
pub type LiveChatGiftDetails {
  LiveChatGiftDetails(
    alt_text: option.Option(String),
    combo_count: option.Option(Int),
    gift_duration: option.Option(String),
    gift_name: option.Option(String),
    gift_url: option.Option(String),
    has_visual_effect: option.Option(Bool),
    jewels_amount: option.Option(Int),
    language: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatGiftDetails) {
  use alt_text <- optional_field("altText", option.None, optional(string))
  use combo_count <- optional_field("comboCount", option.None, optional(int))
  use gift_duration <- optional_field(
    "giftDuration",
    option.None,
    optional(string),
  )
  use gift_name <- optional_field("giftName", option.None, optional(string))
  use gift_url <- optional_field("giftUrl", option.None, optional(string))
  use has_visual_effect <- optional_field(
    "hasVisualEffect",
    option.None,
    optional(bool),
  )
  use jewels_amount <- optional_field(
    "jewelsAmount",
    option.None,
    optional(int),
  )
  use language <- optional_field("language", option.None, optional(string))
  success(
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