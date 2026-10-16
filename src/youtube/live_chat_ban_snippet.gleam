//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatBanSnippet {
  LiveChatBanSnippet(
    ban_duration_seconds: option.Option(String),
    banned_user_details: option.Option(ChannelProfileDetails),
    live_chat_id: option.Option(String),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(LiveChatBanSnippet) {
  use ban_duration_seconds <- optional_field(
    "banDurationSeconds",
    option.None,
    optional(string),
  )
  use banned_user_details <- optional_field(
    "bannedUserDetails",
    option.None,
    optional(channel_profile_details.decoder()),
  )
  use live_chat_id <- optional_field(
    "liveChatId",
    option.None,
    optional(string),
  )
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(
    LiveChatBanSnippet(
      ban_duration_seconds,
      banned_user_details,
      live_chat_id,
      type_,
    ),
  )
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
  use value <- then(string)
  case value {
    "liveChatBanTypeUnspecified" -> success(TypeLiveChatBanTypeUnspecified)
    "permanent" -> success(TypePermanent)
    "temporary" -> success(TypeTemporary)
    _ -> failure(TypeLiveChatBanTypeUnspecified, "a valid Type")
  }
}