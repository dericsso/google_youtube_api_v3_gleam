//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveChatMessageAuthorDetails {
  LiveChatMessageAuthorDetails(
    channel_id: Option(String),
    channel_url: Option(String),
    display_name: Option(String),
    is_chat_moderator: Option(Bool),
    is_chat_owner: Option(Bool),
    is_chat_sponsor: Option(Bool),
    is_verified: Option(Bool),
    profile_image_url: Option(String),
  )
}

pub fn decoder() -> Decoder(LiveChatMessageAuthorDetails) {
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use channel_url <- decode.optional_field(
    "channelUrl",
    option.None,
    decode.optional(decode.string),
  )
  use display_name <- decode.optional_field(
    "displayName",
    option.None,
    decode.optional(decode.string),
  )
  use is_chat_moderator <- decode.optional_field(
    "isChatModerator",
    option.None,
    decode.optional(decode.bool),
  )
  use is_chat_owner <- decode.optional_field(
    "isChatOwner",
    option.None,
    decode.optional(decode.bool),
  )
  use is_chat_sponsor <- decode.optional_field(
    "isChatSponsor",
    option.None,
    decode.optional(decode.bool),
  )
  use is_verified <- decode.optional_field(
    "isVerified",
    option.None,
    decode.optional(decode.bool),
  )
  use profile_image_url <- decode.optional_field(
    "profileImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(LiveChatMessageAuthorDetails(
    channel_id,
    channel_url,
    display_name,
    is_chat_moderator,
    is_chat_owner,
    is_chat_sponsor,
    is_verified,
    profile_image_url,
  ))
}

pub fn to_json(value: LiveChatMessageAuthorDetails) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("channelUrl", json.nullable(value.channel_url, json.string)),
    #("displayName", json.nullable(value.display_name, json.string)),
    #("isChatModerator", json.nullable(value.is_chat_moderator, json.bool)),
    #("isChatOwner", json.nullable(value.is_chat_owner, json.bool)),
    #("isChatSponsor", json.nullable(value.is_chat_sponsor, json.bool)),
    #("isVerified", json.nullable(value.is_verified, json.bool)),
    #("profileImageUrl", json.nullable(value.profile_image_url, json.string)),
  ])
}
