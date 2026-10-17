//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatMembershipGiftingDetails {
  LiveChatMembershipGiftingDetails(
    gift_memberships_count: Option(Int),
    gift_memberships_level_name: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatMembershipGiftingDetails) {
  use gift_memberships_count <- decode.optional_field(
    "giftMembershipsCount",
    option.None,
    decode.optional(decode.int),
  )
  use gift_memberships_level_name <- decode.optional_field(
    "giftMembershipsLevelName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    LiveChatMembershipGiftingDetails(
      gift_memberships_count,
      gift_memberships_level_name,
    ),
  )
}

pub fn to_json(value: LiveChatMembershipGiftingDetails) -> Json {
  json.object(
    [
      #(
        "giftMembershipsCount",
        json.nullable(value.gift_memberships_count, json.int),
      ),
      #(
        "giftMembershipsLevelName",
        json.nullable(value.gift_memberships_level_name, json.string),
      ),
    ],
  )
}