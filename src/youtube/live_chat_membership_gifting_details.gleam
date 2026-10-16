//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
import gleam/option

pub type LiveChatMembershipGiftingDetails {
  LiveChatMembershipGiftingDetails(
    gift_memberships_count: option.Option(Int),
    gift_memberships_level_name: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatMembershipGiftingDetails) {
  use gift_memberships_count <- optional_field(
    "giftMembershipsCount",
    option.None,
    optional(int),
  )
  use gift_memberships_level_name <- optional_field(
    "giftMembershipsLevelName",
    option.None,
    optional(string),
  )
  success(
    LiveChatMembershipGiftingDetails(
      gift_memberships_count,
      gift_memberships_level_name,
    ),
  )
}