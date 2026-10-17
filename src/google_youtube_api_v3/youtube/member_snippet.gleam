//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_profile_details.{type ChannelProfileDetails}
import google_youtube_api_v3/youtube/memberships_details.{type MembershipsDetails}

pub type MemberSnippet {
  MemberSnippet(
    creator_channel_id: Option(String),
    member_details: Option(ChannelProfileDetails),
    memberships_details: Option(MembershipsDetails),
  )
}

pub fn decoder() -> Decoder(MemberSnippet) {
  use creator_channel_id <- decode.optional_field(
    "creatorChannelId",
    option.None,
    decode.optional(decode.string),
  )
  use member_details <- decode.optional_field(
    "memberDetails",
    option.None,
    decode.optional(channel_profile_details.decoder()),
  )
  use memberships_details <- decode.optional_field(
    "membershipsDetails",
    option.None,
    decode.optional(memberships_details.decoder()),
  )
  decode.success(
    MemberSnippet(creator_channel_id, member_details, memberships_details),
  )
}

pub fn to_json(value: MemberSnippet) -> Json {
  json.object(
    [
      #(
        "creatorChannelId",
        json.nullable(value.creator_channel_id, json.string),
      ),
      #(
        "memberDetails",
        json.nullable(value.member_details, channel_profile_details.to_json),
      ),
      #(
        "membershipsDetails",
        json.nullable(value.memberships_details, memberships_details.to_json),
      ),
    ],
  )
}