//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
