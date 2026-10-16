//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_profile_details.{
  type ChannelProfileDetails,
}
import google_youtube_api_v3/youtube/super_sticker_metadata.{
  type SuperStickerMetadata,
}

pub type SuperChatEventSnippet {
  SuperChatEventSnippet(
    amount_micros: Option(String),
    channel_id: Option(String),
    comment_text: Option(String),
    created_at: Option(String),
    currency: Option(String),
    display_string: Option(String),
    is_super_sticker_event: Option(Bool),
    message_type: Option(Int),
    super_sticker_metadata: Option(SuperStickerMetadata),
    supporter_details: Option(ChannelProfileDetails),
  )
}

pub fn decoder() -> Decoder(SuperChatEventSnippet) {
  use amount_micros <- decode.optional_field(
    "amountMicros",
    option.None,
    decode.optional(decode.string),
  )
  use channel_id <- decode.optional_field(
    "channelId",
    option.None,
    decode.optional(decode.string),
  )
  use comment_text <- decode.optional_field(
    "commentText",
    option.None,
    decode.optional(decode.string),
  )
  use created_at <- decode.optional_field(
    "createdAt",
    option.None,
    decode.optional(decode.string),
  )
  use currency <- decode.optional_field(
    "currency",
    option.None,
    decode.optional(decode.string),
  )
  use display_string <- decode.optional_field(
    "displayString",
    option.None,
    decode.optional(decode.string),
  )
  use is_super_sticker_event <- decode.optional_field(
    "isSuperStickerEvent",
    option.None,
    decode.optional(decode.bool),
  )
  use message_type <- decode.optional_field(
    "messageType",
    option.None,
    decode.optional(decode.int),
  )
  use super_sticker_metadata <- decode.optional_field(
    "superStickerMetadata",
    option.None,
    decode.optional(super_sticker_metadata.decoder()),
  )
  use supporter_details <- decode.optional_field(
    "supporterDetails",
    option.None,
    decode.optional(channel_profile_details.decoder()),
  )
  decode.success(SuperChatEventSnippet(
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
  ))
}

pub fn to_json(value: SuperChatEventSnippet) -> Json {
  json.object([
    #("amountMicros", json.nullable(value.amount_micros, json.string)),
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("commentText", json.nullable(value.comment_text, json.string)),
    #("createdAt", json.nullable(value.created_at, json.string)),
    #("currency", json.nullable(value.currency, json.string)),
    #("displayString", json.nullable(value.display_string, json.string)),
    #(
      "isSuperStickerEvent",
      json.nullable(value.is_super_sticker_event, json.bool),
    ),
    #("messageType", json.nullable(value.message_type, json.int)),
    #(
      "superStickerMetadata",
      json.nullable(
        value.super_sticker_metadata,
        super_sticker_metadata.to_json,
      ),
    ),
    #(
      "supporterDetails",
      json.nullable(value.supporter_details, channel_profile_details.to_json),
    ),
  ])
}
