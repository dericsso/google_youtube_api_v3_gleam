//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
