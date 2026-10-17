//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/live_chat_message_author_details.{type LiveChatMessageAuthorDetails}
import google_youtube_api_v3/youtube/live_chat_message_snippet.{type LiveChatMessageSnippet}

/// A *liveChatMessage* resource represents a chat message in a YouTube Live Chat.
pub type LiveChatMessage {
  LiveChatMessage(
    author_details: Option(LiveChatMessageAuthorDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(LiveChatMessageSnippet),
  )
}

pub fn decoder() -> Decoder(LiveChatMessage) {
  use author_details <- decode.optional_field(
    "authorDetails",
    option.None,
    decode.optional(live_chat_message_author_details.decoder()),
  )
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(live_chat_message_snippet.decoder()),
  )
  decode.success(LiveChatMessage(author_details, etag, id, kind, snippet))
}

pub fn to_json(value: LiveChatMessage) -> Json {
  json.object(
    [
      #(
        "authorDetails",
        json.nullable(
          value.author_details,
          live_chat_message_author_details.to_json,
        ),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "snippet",
        json.nullable(value.snippet, live_chat_message_snippet.to_json),
      ),
    ],
  )
}