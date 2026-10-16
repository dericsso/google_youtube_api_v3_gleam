//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatNewSponsorDetails {
  LiveChatNewSponsorDetails(
    is_upgrade: Option(Bool),
    member_level_name: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatNewSponsorDetails) {
  use is_upgrade <- decode.optional_field(
    "isUpgrade",
    option.None,
    decode.optional(decode.bool),
  )
  use member_level_name <- decode.optional_field(
    "memberLevelName",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatNewSponsorDetails(is_upgrade, member_level_name))
}

pub fn to_json(value: LiveChatNewSponsorDetails) -> Json {
  json.object([
    #("isUpgrade", json.nullable(value.is_upgrade, json.bool)),
    #("memberLevelName", json.nullable(value.member_level_name, json.string)),
  ])
}
