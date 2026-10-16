//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/super_chat_event_snippet.{type SuperChatEventSnippet}

/// A `__superChatEvent__` resource represents a Super Chat purchase on a YouTube channel.
pub type SuperChatEvent {
  SuperChatEvent(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(SuperChatEventSnippet),
  )
}

pub fn decoder() -> Decoder(SuperChatEvent) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(super_chat_event_snippet.decoder()),
  )
  success(SuperChatEvent(etag, id, kind, snippet))
}