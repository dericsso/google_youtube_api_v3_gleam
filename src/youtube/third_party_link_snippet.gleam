//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/channel_to_affiliate_program_link_details.{type ChannelToAffiliateProgramLinkDetails}
import youtube/channel_to_store_link_details.{type ChannelToStoreLinkDetails}

/// Basic information about a third party account link, including its type and type-specific information.
pub type ThirdPartyLinkSnippet {
  ThirdPartyLinkSnippet(
    channel_to_affiliate_program_link:
    option.Option(ChannelToAffiliateProgramLinkDetails),
    channel_to_store_link: option.Option(ChannelToStoreLinkDetails),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(ThirdPartyLinkSnippet) {
  use channel_to_affiliate_program_link <- optional_field(
    "channelToAffiliateProgramLink",
    option.None,
    optional(channel_to_affiliate_program_link_details.decoder()),
  )
  use channel_to_store_link <- optional_field(
    "channelToStoreLink",
    option.None,
    optional(channel_to_store_link_details.decoder()),
  )
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(
    ThirdPartyLinkSnippet(
      channel_to_affiliate_program_link,
      channel_to_store_link,
      type_,
    ),
  )
}

/// Type of the link named after the entities that are being linked.
pub type Type {
  TypeLinkUnspecified
  TypeChannelToStoreLink
  TypeChannelToAffiliateProgramLink
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeLinkUnspecified -> "linkUnspecified"
    TypeChannelToStoreLink -> "channelToStoreLink"
    TypeChannelToAffiliateProgramLink -> "channelToAffiliateProgramLink"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- then(string)
  case value {
    "linkUnspecified" -> success(TypeLinkUnspecified)
    "channelToStoreLink" -> success(TypeChannelToStoreLink)
    "channelToAffiliateProgramLink" -> success(
      TypeChannelToAffiliateProgramLink,
    )
    _ -> failure(TypeLinkUnspecified, "a valid Type")
  }
}