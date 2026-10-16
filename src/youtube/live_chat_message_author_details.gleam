//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
import gleam/option

pub type LiveChatMessageAuthorDetails {
  LiveChatMessageAuthorDetails(
    channel_id: option.Option(String),
    channel_url: option.Option(String),
    display_name: option.Option(String),
    is_chat_moderator: option.Option(Bool),
    is_chat_owner: option.Option(Bool),
    is_chat_sponsor: option.Option(Bool),
    is_verified: option.Option(Bool),
    profile_image_url: option.Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatMessageAuthorDetails) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use channel_url <- optional_field("channelUrl", option.None, optional(string))
  use display_name <- optional_field(
    "displayName",
    option.None,
    optional(string),
  )
  use is_chat_moderator <- optional_field(
    "isChatModerator",
    option.None,
    optional(bool),
  )
  use is_chat_owner <- optional_field(
    "isChatOwner",
    option.None,
    optional(bool),
  )
  use is_chat_sponsor <- optional_field(
    "isChatSponsor",
    option.None,
    optional(bool),
  )
  use is_verified <- optional_field("isVerified", option.None, optional(bool))
  use profile_image_url <- optional_field(
    "profileImageUrl",
    option.None,
    optional(string),
  )
  success(
    LiveChatMessageAuthorDetails(
      channel_id,
      channel_url,
      display_name,
      is_chat_moderator,
      is_chat_owner,
      is_chat_sponsor,
      is_verified,
      profile_image_url,
    ),
  )
}