//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/memberships_level_snippet.{type MembershipsLevelSnippet}

/// A *membershipsLevel* resource represents an offer made by YouTube creators for their fans. Users can become members of the channel by joining one of the available levels. They will provide recurring monetary support and receives special benefits.
pub type MembershipsLevel {
  MembershipsLevel(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(MembershipsLevelSnippet),
  )
}

pub fn decoder() -> Decoder(MembershipsLevel) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(memberships_level_snippet.decoder()),
  )
  success(MembershipsLevel(etag, id, kind, snippet))
}