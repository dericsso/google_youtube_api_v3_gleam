//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/channel_to_affiliate_program_link_details.{
  type ChannelToAffiliateProgramLinkDetails,
}
import youtube/channel_to_store_link_details.{type ChannelToStoreLinkDetails}

/// Basic information about a third party account link, including its type and type-specific information.
pub type ThirdPartyLinkSnippet {
  ThirdPartyLinkSnippet(
    channel_to_affiliate_program_link: option.Option(
      ChannelToAffiliateProgramLinkDetails,
    ),
    channel_to_store_link: option.Option(ChannelToStoreLinkDetails),
    type_: option.Option(String),
  )
}
