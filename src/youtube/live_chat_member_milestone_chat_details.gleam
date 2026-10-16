//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success}
import gleam/option

pub type LiveChatMemberMilestoneChatDetails {
  LiveChatMemberMilestoneChatDetails(
    member_level_name: option.Option(String),
    member_month: option.Option(Int),
    user_comment: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatMemberMilestoneChatDetails) {
  use member_level_name <- optional_field(
    "memberLevelName",
    option.None,
    optional(string),
  )
  use member_month <- optional_field("memberMonth", option.None, optional(int))
  use user_comment <- optional_field(
    "userComment",
    option.None,
    optional(string),
  )
  success(
    LiveChatMemberMilestoneChatDetails(
      member_level_name,
      member_month,
      user_comment,
    ),
  )
}