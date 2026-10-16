//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/live_chat_ban_snippet.{type LiveChatBanSnippet}

/// A `__liveChatBan__` resource represents a ban for a YouTube live chat.
pub type LiveChatBan {
  LiveChatBan(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(LiveChatBanSnippet),
  )
}

pub fn decoder() -> Decoder(LiveChatBan) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(live_chat_ban_snippet.decoder()),
  )
  success(LiveChatBan(etag, id, kind, snippet))
}