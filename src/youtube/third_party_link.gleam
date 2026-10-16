//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
