//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
