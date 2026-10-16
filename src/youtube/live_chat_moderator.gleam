//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/live_chat_moderator_snippet.{type LiveChatModeratorSnippet}

/// A *liveChatModerator* resource represents a moderator for a YouTube live chat. A chat moderator has the ability to ban/unban users from a chat, remove message, etc.
pub type LiveChatModerator {
  LiveChatModerator(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(LiveChatModeratorSnippet),
  )
}

pub fn decoder() -> Decoder(LiveChatModerator) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(live_chat_moderator_snippet.decoder()),
  )
  success(LiveChatModerator(etag, id, kind, snippet))
}