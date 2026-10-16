//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}
import youtube/super_sticker_metadata.{type SuperStickerMetadata}

pub type SuperChatEventSnippet {
  SuperChatEventSnippet(
    amount_micros: option.Option(String),
    channel_id: option.Option(String),
    comment_text: option.Option(String),
    created_at: option.Option(String),
    currency: option.Option(String),
    display_string: option.Option(String),
    is_super_sticker_event: option.Option(Bool),
    message_type: option.Option(Int),
    super_sticker_metadata: option.Option(SuperStickerMetadata),
    supporter_details: option.Option(ChannelProfileDetails),
  )
}
