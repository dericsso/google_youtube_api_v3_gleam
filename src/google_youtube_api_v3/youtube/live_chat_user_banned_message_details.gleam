//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_profile_details.{
  type ChannelProfileDetails,
}

pub type LiveChatUserBannedMessageDetails {
  LiveChatUserBannedMessageDetails(
    ban_duration_seconds: Option(String),
    ban_type: Option(BanType),
    banned_user_details: Option(ChannelProfileDetails),
  )
}

pub fn decoder() -> Decoder(LiveChatUserBannedMessageDetails) {
  use ban_duration_seconds <- decode.optional_field(
    "banDurationSeconds",
    option.None,
    decode.optional(decode.string),
  )
  use ban_type <- decode.optional_field(
    "banType",
    option.None,
    decode.optional(ban_type_decoder()),
  )
  use banned_user_details <- decode.optional_field(
    "bannedUserDetails",
    option.None,
    decode.optional(channel_profile_details.decoder()),
  )
  decode.success(LiveChatUserBannedMessageDetails(
    ban_duration_seconds,
    ban_type,
    banned_user_details,
  ))
}

pub fn to_json(value: LiveChatUserBannedMessageDetails) -> Json {
  json.object([
    #(
      "banDurationSeconds",
      json.nullable(value.ban_duration_seconds, json.string),
    ),
    #(
      "banType",
      json.nullable(value.ban_type, fn(e) { json.string(ban_type_to_string(e)) }),
    ),
    #(
      "bannedUserDetails",
      json.nullable(value.banned_user_details, channel_profile_details.to_json),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "permanent" -> decode.success(BanTypePermanent)
    "temporary" -> decode.success(BanTypeTemporary)
    _ -> decode.failure(BanTypePermanent, "a valid BanType")
  }
}
