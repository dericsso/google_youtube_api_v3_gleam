//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/live_chat_message_author_details.{type LiveChatMessageAuthorDetails}
import youtube/live_chat_message_snippet.{type LiveChatMessageSnippet}

/// A *liveChatMessage* resource represents a chat message in a YouTube Live Chat.
pub type LiveChatMessage {
  LiveChatMessage(
    author_details: option.Option(LiveChatMessageAuthorDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(LiveChatMessageSnippet),
  )
}

pub fn decoder() -> Decoder(LiveChatMessage) {
  use author_details <- optional_field(
    "authorDetails",
    option.None,
    optional(live_chat_message_author_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(live_chat_message_snippet.decoder()),
  )
  success(LiveChatMessage(author_details, etag, id, kind, snippet))
}