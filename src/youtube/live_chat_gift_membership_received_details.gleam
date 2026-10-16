//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type LiveChatGiftMembershipReceivedDetails {
  LiveChatGiftMembershipReceivedDetails(
    associated_membership_gifting_message_id: option.Option(String),
    gifter_channel_id: option.Option(String),
    member_level_name: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatGiftMembershipReceivedDetails) {
  use associated_membership_gifting_message_id <- optional_field(
    "associatedMembershipGiftingMessageId",
    option.None,
    optional(string),
  )
  use gifter_channel_id <- optional_field(
    "gifterChannelId",
    option.None,
    optional(string),
  )
  use member_level_name <- optional_field(
    "memberLevelName",
    option.None,
    optional(string),
  )
  success(
    LiveChatGiftMembershipReceivedDetails(
      associated_membership_gifting_message_id,
      gifter_channel_id,
      member_level_name,
    ),
  )
}