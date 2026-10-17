//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/live_chat_moderator_snippet.{type LiveChatModeratorSnippet}

/// A *liveChatModerator* resource represents a moderator for a YouTube live chat. A chat moderator has the ability to ban/unban users from a chat, remove message, etc.
pub type LiveChatModerator {
  LiveChatModerator(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(LiveChatModeratorSnippet),
  )
}

pub fn decoder() -> Decoder(LiveChatModerator) {
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
    decode.optional(live_chat_moderator_snippet.decoder()),
  )
  decode.success(LiveChatModerator(etag, id, kind, snippet))
}

pub fn to_json(value: LiveChatModerator) -> Json {
  json.object(
    [
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #(
        "snippet",
        json.nullable(value.snippet, live_chat_moderator_snippet.to_json),
      ),
    ],
  )
}