//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatUserBannedMessageDetails {
  LiveChatUserBannedMessageDetails(
    ban_duration_seconds: option.Option(String),
    ban_type: option.Option(BanType),
    banned_user_details: option.Option(ChannelProfileDetails),
  )
}

pub fn decoder() -> Decoder(LiveChatUserBannedMessageDetails) {
  use ban_duration_seconds <- optional_field(
    "banDurationSeconds",
    option.None,
    optional(string),
  )
  use ban_type <- optional_field(
    "banType",
    option.None,
    optional(ban_type_decoder()),
  )
  use banned_user_details <- optional_field(
    "bannedUserDetails",
    option.None,
    optional(channel_profile_details.decoder()),
  )
  success(
    LiveChatUserBannedMessageDetails(
      ban_duration_seconds,
      ban_type,
      banned_user_details,
    ),
  )
}

/// The type of ban.
pub type BanType {
  BanTypePermanent
  BanTypeTemporary
}

pub fn ban_type_to_string(value: BanType) -> String {
  case value {
    BanTypePermanent -> "permanent"
    BanTypeTemporary -> "temporary"
  }
}

pub fn ban_type_decoder() -> Decoder(BanType) {
  use value <- then(string)
  case value {
    "permanent" -> success(BanTypePermanent)
    "temporary" -> success(BanTypeTemporary)
    _ -> failure(BanTypePermanent, "a valid BanType")
  }
}