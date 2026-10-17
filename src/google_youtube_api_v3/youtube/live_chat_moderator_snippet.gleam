//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatModeratorSnippet {
  LiveChatModeratorSnippet(
    live_chat_id: Option(String),
    moderator_details: Option(ChannelProfileDetails),
  )
}

pub fn decoder() -> Decoder(LiveChatModeratorSnippet) {
  use live_chat_id <- decode.optional_field(
    "liveChatId",
    option.None,
    decode.optional(decode.string),
  )
  use moderator_details <- decode.optional_field(
    "moderatorDetails",
    option.None,
    decode.optional(channel_profile_details.decoder()),
  )
  decode.success(LiveChatModeratorSnippet(live_chat_id, moderator_details))
}

pub fn to_json(value: LiveChatModeratorSnippet) -> Json {
  json.object(
    [
      #("liveChatId", json.nullable(value.live_chat_id, json.string)),
      #(
        "moderatorDetails",
        json.nullable(value.moderator_details, channel_profile_details.to_json),
      ),
    ],
  )
}