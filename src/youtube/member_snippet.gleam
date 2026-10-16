//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
