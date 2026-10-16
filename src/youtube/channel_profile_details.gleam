//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option

pub type ChannelProfileDetails {
  ChannelProfileDetails(
    channel_id: option.Option(String),
    channel_url: option.Option(String),
    display_name: option.Option(String),
    profile_image_url: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ChannelProfileDetails) {
  use channel_id <- optional_field("channelId", option.None, optional(string))
  use channel_url <- optional_field("channelUrl", option.None, optional(string))
  use display_name <- optional_field(
    "displayName",
    option.None,
    optional(string),
  )
  use profile_image_url <- optional_field(
    "profileImageUrl",
    option.None,
    optional(string),
  )
  success(
    ChannelProfileDetails(
      channel_id,
      channel_url,
      display_name,
      profile_image_url,
    ),
  )
}