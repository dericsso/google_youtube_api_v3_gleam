//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel_to_affiliate_program_link_details.{type ChannelToAffiliateProgramLinkDetails}
import google_youtube_api_v3/youtube/channel_to_store_link_details.{type ChannelToStoreLinkDetails}

/// Basic information about a third party account link, including its type and type-specific information.
pub type ThirdPartyLinkSnippet {
  ThirdPartyLinkSnippet(
    channel_to_affiliate_program_link:
    Option(ChannelToAffiliateProgramLinkDetails),
    channel_to_store_link: Option(ChannelToStoreLinkDetails),
    type_: Option(Type),
  )
}

pub fn decoder() -> Decoder(ThirdPartyLinkSnippet) {
  use channel_to_affiliate_program_link <- decode.optional_field(
    "channelToAffiliateProgramLink",
    option.None,
    decode.optional(channel_to_affiliate_program_link_details.decoder()),
  )
  use channel_to_store_link <- decode.optional_field(
    "channelToStoreLink",
    option.None,
    decode.optional(channel_to_store_link_details.decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(
    ThirdPartyLinkSnippet(
      channel_to_affiliate_program_link,
      channel_to_store_link,
      type_,
    ),
  )
}

pub fn to_json(value: ThirdPartyLinkSnippet) -> Json {
  json.object(
    [
      #(
        "channelToAffiliateProgramLink",
        json.nullable(
          value.channel_to_affiliate_program_link,
          channel_to_affiliate_program_link_details.to_json,
        ),
      ),
      #(
        "channelToStoreLink",
        json.nullable(
          value.channel_to_store_link,
          channel_to_store_link_details.to_json,
        ),
      ),
      #(
        "type",
        json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
      ),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "linkUnspecified" -> decode.success(TypeLinkUnspecified)
    "channelToStoreLink" -> decode.success(TypeChannelToStoreLink)
    "channelToAffiliateProgramLink" -> decode.success(
      TypeChannelToAffiliateProgramLink,
    )
    _ -> decode.failure(TypeLinkUnspecified, "a valid Type")
  }
}