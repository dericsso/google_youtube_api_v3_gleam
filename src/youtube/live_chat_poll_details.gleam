//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/live_chat_poll_details_poll_metadata.{type LiveChatPollDetailsPollMetadata}

pub type LiveChatPollDetails {
  LiveChatPollDetails(
    metadata: option.Option(LiveChatPollDetailsPollMetadata),
    status: option.Option(Status),
  )
}

pub fn decoder() -> Decoder(LiveChatPollDetails) {
  use metadata <- optional_field(
    "metadata",
    option.None,
    optional(live_chat_poll_details_poll_metadata.decoder()),
  )
  use status <- optional_field(
    "status",
    option.None,
    optional(status_decoder()),
  )
  success(LiveChatPollDetails(metadata, status))
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
  use value <- then(string)
  case value {
    "unknown" -> success(StatusUnknown)
    "active" -> success(StatusActive)
    "closed" -> success(StatusClosed)
    _ -> failure(StatusUnknown, "a valid Status")
  }
}