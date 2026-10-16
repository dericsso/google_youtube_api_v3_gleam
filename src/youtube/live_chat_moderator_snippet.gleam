//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatModeratorSnippet {
  LiveChatModeratorSnippet(
    live_chat_id: option.Option(String),
    moderator_details: option.Option(ChannelProfileDetails),
  )
}
