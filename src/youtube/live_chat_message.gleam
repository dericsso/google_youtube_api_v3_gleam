//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/live_chat_message_author_details.{
  type LiveChatMessageAuthorDetails,
}
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
