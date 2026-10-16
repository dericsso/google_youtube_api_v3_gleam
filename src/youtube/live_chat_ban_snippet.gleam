//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatBanSnippet {
  LiveChatBanSnippet(
    ban_duration_seconds: Option(String),
    banned_user_details: Option(ChannelProfileDetails),
    live_chat_id: Option(String),
    type_: Option(Type),
  )
}

pub fn decoder() -> Decoder(LiveChatBanSnippet) {
  use ban_duration_seconds <- decode.optional_field(
    "banDurationSeconds",
    option.None,
    decode.optional(decode.string),
  )
  use banned_user_details <- decode.optional_field(
    "bannedUserDetails",
    option.None,
    decode.optional(channel_profile_details.decoder()),
  )
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(LiveChatBanSnippet(
    ban_duration_seconds,
    banned_user_details,
    live_chat_id,
    type_,
  ))
}

pub fn to_json(value: LiveChatBanSnippet) -> Json {
  json.object([
    #(
      "banDurationSeconds",
      json.nullable(value.ban_duration_seconds, json.string),
    ),
    #(
      "bannedUserDetails",
      json.nullable(value.banned_user_details, channel_profile_details.to_json),
    ),
    #("liveChatId", json.nullable(value.live_chat_id, json.string)),
    #(
      "type",
      json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
    ),
  ])
}

/// The type of ban.
pub type Type {
  TypeLiveChatBanTypeUnspecified
  TypePermanent
  TypeTemporary
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeLiveChatBanTypeUnspecified -> "liveChatBanTypeUnspecified"
    TypePermanent -> "permanent"
    TypeTemporary -> "temporary"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- decode.then(decode.string)
  case value {
    "liveChatBanTypeUnspecified" ->
      decode.success(TypeLiveChatBanTypeUnspecified)
    "permanent" -> decode.success(TypePermanent)
    "temporary" -> decode.success(TypeTemporary)
    _ -> decode.failure(TypeLiveChatBanTypeUnspecified, "a valid Type")
  }
}
