//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type ChannelProfileDetails {
  ChannelProfileDetails(
    channel_id: Option(String),
    channel_url: Option(String),
    display_name: Option(String),
    profile_image_url: Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelProfileDetails) {
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
  use profile_image_url <- decode.optional_field(
    "profileImageUrl",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ChannelProfileDetails(
    channel_id,
    channel_url,
    display_name,
    profile_image_url,
  ))
}

pub fn to_json(value: ChannelProfileDetails) -> Json {
  json.object([
    #("channelId", json.nullable(value.channel_id, json.string)),
    #("channelUrl", json.nullable(value.channel_url, json.string)),
    #("displayName", json.nullable(value.display_name, json.string)),
    #("profileImageUrl", json.nullable(value.profile_image_url, json.string)),
  ])
}
