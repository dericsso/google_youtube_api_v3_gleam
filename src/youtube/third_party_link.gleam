//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/third_party_link_snippet.{type ThirdPartyLinkSnippet}
import youtube/third_party_link_status.{type ThirdPartyLinkStatus}

/// A *third party account link* resource represents a link between a YouTube account or a channel and an account on a third-party service.
pub type ThirdPartyLink {
  ThirdPartyLink(
    etag: option.Option(String),
    kind: option.Option(String),
    linking_token: option.Option(String),
    snippet: option.Option(ThirdPartyLinkSnippet),
    status: option.Option(ThirdPartyLinkStatus),
  )
}

pub fn decoder() -> Decoder(ThirdPartyLink) {
  use etag <- optional_field("etag", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use linking_token <- optional_field(
    "linkingToken",
    option.None,
    optional(string),
  )
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(third_party_link_snippet.decoder()),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(third_party_link_status.decoder()),
  )
  success(ThirdPartyLink(etag, kind, linking_token, snippet, status))
}