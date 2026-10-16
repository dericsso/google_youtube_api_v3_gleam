//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}

pub type LiveChatUserBannedMessageDetails {
  LiveChatUserBannedMessageDetails(
    ban_duration_seconds: option.Option(String),
    ban_type: option.Option(String),
    banned_user_details: option.Option(ChannelProfileDetails),
  )
}
