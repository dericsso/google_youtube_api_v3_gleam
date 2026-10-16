//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, bool, success}
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

pub fn decoder() -> Decoder(SuperChatEventSnippet) {
  use amount_micros <- optional_field(
    "amountMicros",
    option.None,
    optional(string),
  )
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use comment_text <- optional_field(
    "commentText",
    option.None,
    optional(string),
  )
  use created_at <- optional_field("createdAt", option.None, optional(string))
  use currency <- optional_field("currency", option.None, optional(string))
  use display_string <- optional_field(
    "displayString",
    option.None,
    optional(string),
  )
  use is_super_sticker_event <- optional_field(
    "isSuperStickerEvent",
    option.None,
    optional(bool),
  )
  use message_type <- optional_field("messageType", option.None, optional(int))
  use super_sticker_metadata <- optional_field(
    "superStickerMetadata",
    option.None,
    optional(super_sticker_metadata.decoder()),
  )
  use supporter_details <- optional_field(
    "supporterDetails",
    option.None,
    optional(channel_profile_details.decoder()),
  )
  success(
    SuperChatEventSnippet(
      amount_micros,
      channel_id,
      comment_text,
      created_at,
      currency,
      display_string,
      is_super_sticker_event,
      message_type,
      super_sticker_metadata,
      supporter_details,
    ),
  )
}