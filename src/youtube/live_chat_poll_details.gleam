//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/live_chat_poll_details_poll_metadata.{
  type LiveChatPollDetailsPollMetadata,
}

pub type LiveChatPollDetails {
  LiveChatPollDetails(
    metadata: Option(LiveChatPollDetailsPollMetadata),
    status: Option(Status),
  )
}

pub fn decoder() -> Decoder(LiveChatPollDetails) {
  use metadata <- decode.optional_field(
    "metadata",
    option.None,
    decode.optional(live_chat_poll_details_poll_metadata.decoder()),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(status_decoder()),
  )
  decode.success(LiveChatPollDetails(metadata, status))
}

pub fn to_json(value: LiveChatPollDetails) -> Json {
  json.object([
    #(
      "metadata",
      json.nullable(
        value.metadata,
        live_chat_poll_details_poll_metadata.to_json,
      ),
    ),
    #(
      "status",
      json.nullable(value.status, fn(e) { json.string(status_to_string(e)) }),
    ),
  ])
}

pub type Status {
  StatusUnknown
  StatusActive
  StatusClosed
}

pub fn status_to_string(value: Status) -> String {
  case value {
    StatusUnknown -> "unknown"
    StatusActive -> "active"
    StatusClosed -> "closed"
  }
}

pub fn status_decoder() -> Decoder(Status) {
  use value <- decode.then(decode.string)
  case value {
    "unknown" -> decode.success(StatusUnknown)
    "active" -> decode.success(StatusActive)
    "closed" -> decode.success(StatusClosed)
    _ -> decode.failure(StatusUnknown, "a valid Status")
  }
}
