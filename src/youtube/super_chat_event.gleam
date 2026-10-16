//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/super_chat_event_snippet.{type SuperChatEventSnippet}

/// A `__superChatEvent__` resource represents a Super Chat purchase on a YouTube channel.
pub type SuperChatEvent {
  SuperChatEvent(
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(SuperChatEventSnippet),
  )
}

pub fn decoder() -> Decoder(SuperChatEvent) {
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
    decode.optional(super_chat_event_snippet.decoder()),
  )
  decode.success(SuperChatEvent(etag, id, kind, snippet))
}

pub fn to_json(value: SuperChatEvent) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #("kind", json.nullable(value.kind, json.string)),
    #("snippet", json.nullable(value.snippet, super_chat_event_snippet.to_json)),
  ])
}
