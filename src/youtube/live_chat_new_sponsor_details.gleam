//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
import gleam/option

pub type LiveChatNewSponsorDetails {
  LiveChatNewSponsorDetails(
    is_upgrade: option.Option(Bool),
    member_level_name: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatNewSponsorDetails) {
  use is_upgrade <- optional_field("isUpgrade", option.None, optional(bool))
  use member_level_name <- optional_field(
    "memberLevelName",
    option.None,
    optional(string),
  )
  success(LiveChatNewSponsorDetails(is_upgrade, member_level_name))
}