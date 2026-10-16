//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
