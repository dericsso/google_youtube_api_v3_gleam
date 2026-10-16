//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
