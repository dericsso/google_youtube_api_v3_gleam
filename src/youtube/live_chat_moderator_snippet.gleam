//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatModeratorSnippet {
  LiveChatModeratorSnippet(
    live_chat_id: option.Option(String),
    moderator_details: option.Option(ChannelProfileDetails),
  )
}

pub fn decoder() -> Decoder(LiveChatModeratorSnippet) {
  use live_chat_id <- optional_field(
    "liveChatId",
    option.None,
    optional(string),
  )
  use moderator_details <- optional_field(
    "moderatorDetails",
    option.None,
    optional(channel_profile_details.decoder()),
  )
  success(LiveChatModeratorSnippet(live_chat_id, moderator_details))
}