//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/member_snippet.{type MemberSnippet}

/// A *member* resource represents a member for a YouTube channel. A member provides recurring monetary support to a creator and receives special benefits.
pub type Member {
  Member(
    etag: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(MemberSnippet),
  )
}

pub fn decoder() -> Decoder(Member) {
  use etag <- optional_field("etag", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(member_snippet.decoder()),
  )
  success(Member(etag, kind, snippet))
}