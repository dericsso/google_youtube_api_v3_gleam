//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatMemberMilestoneChatDetails {
  LiveChatMemberMilestoneChatDetails(
    member_level_name: Option(String),
    member_month: Option(Int),
    user_comment: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatMemberMilestoneChatDetails) {
  use member_level_name <- decode.optional_field(
    "memberLevelName",
    option.None,
    decode.optional(decode.string),
  )
  use member_month <- decode.optional_field(
    "memberMonth",
    option.None,
    decode.optional(decode.int),
  )
  use user_comment <- decode.optional_field(
    "userComment",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
    LiveChatMemberMilestoneChatDetails(
      member_level_name,
      member_month,
      user_comment,
    ),
  )
}

pub fn to_json(value: LiveChatMemberMilestoneChatDetails) -> Json {
  json.object(
    [
      #("memberLevelName", json.nullable(value.member_level_name, json.string)),
      #("memberMonth", json.nullable(value.member_month, json.int)),
      #("userComment", json.nullable(value.user_comment, json.string)),
    ],
  )
}