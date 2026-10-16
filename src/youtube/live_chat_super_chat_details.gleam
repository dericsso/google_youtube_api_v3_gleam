//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

pub type LiveChatSuperChatDetails {
  LiveChatSuperChatDetails(
    amount_display_string: option.Option(String),
    amount_micros: option.Option(String),
    currency: option.Option(String),
    tier: option.Option(Int),
    user_comment: option.Option(String),
  )
}
