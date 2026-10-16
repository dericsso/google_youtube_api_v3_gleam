//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/channel_profile_details.{type ChannelProfileDetails}
import youtube/memberships_details.{type MembershipsDetails}

pub type MemberSnippet {
  MemberSnippet(
    creator_channel_id: option.Option(String),
    member_details: option.Option(ChannelProfileDetails),
    memberships_details: option.Option(MembershipsDetails),
  )
}

pub fn decoder() -> Decoder(MemberSnippet) {
  use creator_channel_id <- optional_field(
    "creatorChannelId",
    option.None,
    optional(string),
  )
  use member_details <- optional_field(
    "memberDetails",
    option.None,
    optional(channel_profile_details.decoder()),
  )
  use memberships_details <- optional_field(
    "membershipsDetails",
    option.None,
    optional(memberships_details.decoder()),
  )
  success(
    MemberSnippet(creator_channel_id, member_details, memberships_details),
  )
}