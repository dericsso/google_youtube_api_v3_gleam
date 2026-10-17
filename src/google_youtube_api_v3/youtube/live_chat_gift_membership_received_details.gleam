//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatGiftMembershipReceivedDetails {
  LiveChatGiftMembershipReceivedDetails(
    associated_membership_gifting_message_id: Option(String),
    gifter_channel_id: Option(String),
    member_level_name: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatGiftMembershipReceivedDetails) {
  use associated_membership_gifting_message_id <- decode.optional_field(
    "associatedMembershipGiftingMessageId",
    option.None,
    decode.optional(decode.string),
  )
  use gifter_channel_id <- decode.optional_field(
    "gifterChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use member_level_name <- decode.optional_field(
    "memberLevelName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    LiveChatGiftMembershipReceivedDetails(
      associated_membership_gifting_message_id,
      gifter_channel_id,
      member_level_name,
    ),
  )
}

pub fn to_json(value: LiveChatGiftMembershipReceivedDetails) -> Json {
  json.object(
    [
      #(
        "associatedMembershipGiftingMessageId",
        json.nullable(
          value.associated_membership_gifting_message_id,
          json.string,
        ),
      ),
      #("gifterChannelId", json.nullable(value.gifter_channel_id, json.string)),
      #("memberLevelName", json.nullable(value.member_level_name, json.string)),
    ],
  )
}