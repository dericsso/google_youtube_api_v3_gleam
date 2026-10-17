//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/channel.{type ChannelToAffiliateProgramLinkDetails, type ChannelToStoreLinkDetails}

/// A *third party account link* resource represents a link between a YouTube account or a channel and an account on a third-party service.
pub type ThirdPartyLink {
  ThirdPartyLink(
    etag: Option(String),
    kind: Option(String),
    linking_token: Option(String),
    snippet: Option(ThirdPartyLinkSnippet),
    status: Option(ThirdPartyLinkStatus),
  )
}

pub fn third_party_link_decoder() -> Decoder(ThirdPartyLink) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use linking_token <- decode.optional_field(
    "linkingToken",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(third_party_link_snippet_decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(third_party_link_status_decoder()),
  )
  decode.success(ThirdPartyLink(etag, kind, linking_token, snippet, status))
}

pub fn third_party_link_to_json(value: ThirdPartyLink) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("linkingToken", json.nullable(value.linking_token, json.string)),
      #(
        "snippet",
        json.nullable(value.snippet, third_party_link_snippet_to_json),
      ),
      #("status", json.nullable(value.status, third_party_link_status_to_json)),
    ],
  )
}

pub type ThirdPartyLinkListResponse {
  ThirdPartyLinkListResponse(
    etag: Option(String),
    items: Option(List(ThirdPartyLink)),
    kind: Option(String),
  )
}

pub fn third_party_link_list_response_decoder() -> Decoder(
  ThirdPartyLinkListResponse,
) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use items <- decode.optional_field(
    "items",
    option.None,
    decode.optional(decode.list(third_party_link_decoder())),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ThirdPartyLinkListResponse(etag, items, kind))
}

pub fn third_party_link_list_response_to_json(value: ThirdPartyLinkListResponse) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #(
        "items",
        json.nullable(
          value.items,
          fn(items)
          { json.array(items, third_party_link_to_json) },
        ),
      ),
      #("kind", json.nullable(value.kind, json.string)),
    ],
  )
}

/// Basic information about a third party account link, including its type and type-specific information.
pub type ThirdPartyLinkSnippet {
  ThirdPartyLinkSnippet(
    channel_to_affiliate_program_link:
    Option(ChannelToAffiliateProgramLinkDetails),
    channel_to_store_link: Option(ChannelToStoreLinkDetails),
    type_: Option(Type),
  )
}

pub fn third_party_link_snippet_decoder() -> Decoder(ThirdPartyLinkSnippet) {
  use channel_to_affiliate_program_link <- decode.optional_field(
    "channelToAffiliateProgramLink",
    option.None,
    decode.optional(channel.channel_to_affiliate_program_link_details_decoder()),
  )
  use channel_to_store_link <- decode.optional_field(
    "channelToStoreLink",
    option.None,
    decode.optional(channel.channel_to_store_link_details_decoder()),
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

pub fn third_party_link_snippet_to_json(value: ThirdPartyLinkSnippet) -> Json {
  json.object(
    [
      #(
        "channelToAffiliateProgramLink",
        json.nullable(
          value.channel_to_affiliate_program_link,
          channel.channel_to_affiliate_program_link_details_to_json,
        ),
      ),
      #(
        "channelToStoreLink",
        json.nullable(
          value.channel_to_store_link,
          channel.channel_to_store_link_details_to_json,
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

/// The third-party link status object contains information about the status of the link.
pub type ThirdPartyLinkStatus {
  ThirdPartyLinkStatus(link_status: Option(LinkStatus))
}

pub fn third_party_link_status_decoder() -> Decoder(ThirdPartyLinkStatus) {
  use link_status <- decode.optional_field(
    "linkStatus",
    option.None,
    decode.optional(link_status_decoder()),
  )
  decode.success(ThirdPartyLinkStatus(link_status))
}

pub fn third_party_link_status_to_json(value: ThirdPartyLinkStatus) -> Json {
  json.object(
    [
      #(
        "linkStatus",
        json.nullable(
          value.link_status,
          fn(e)
          { json.string(link_status_to_string(e)) },
        ),
      ),
    ],
  )
}

pub type LinkStatus {
  LinkStatusUnknown
  LinkStatusFailed
  LinkStatusPending
  LinkStatusLinked
}

pub fn link_status_to_string(value: LinkStatus) -> String {
  case value {
    LinkStatusUnknown -> "unknown"
    LinkStatusFailed -> "failed"
    LinkStatusPending -> "pending"
    LinkStatusLinked -> "linked"
  }
}

pub fn link_status_decoder() -> Decoder(LinkStatus) {
  use value <- decode.then(decode.string)
  case value {
    "unknown" -> decode.success(LinkStatusUnknown)
    "failed" -> decode.success(LinkStatusFailed)
    "pending" -> decode.success(LinkStatusPending)
    "linked" -> decode.success(LinkStatusLinked)
    _ -> decode.failure(LinkStatusUnknown, "a valid LinkStatus")
  }
}