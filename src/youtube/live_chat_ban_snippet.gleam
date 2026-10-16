//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatBanSnippet {
  LiveChatBanSnippet(
    ban_duration_seconds: option.Option(String),
    banned_user_details: option.Option(ChannelProfileDetails),
    live_chat_id: option.Option(String),
    type_: option.Option(String),
  )
}
