//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Information about the playlist item's privacy status.
pub type PlaylistItemStatus {
  PlaylistItemStatus(privacy_status: Option(PrivacyStatus))
}

pub fn decoder() -> Decoder(PlaylistItemStatus) {
  use privacy_status <- decode.optional_field(
    "privacyStatus",
    option.None,
    decode.optional(privacy_status_decoder()),
  )
  decode.success(PlaylistItemStatus(privacy_status))
}

pub fn to_json(value: PlaylistItemStatus) -> Json {
  json.object(
    [
      #(
        "privacyStatus",
        json.nullable(
          value.privacy_status,
          fn(e)
          { json.string(privacy_status_to_string(e)) },
        ),
      ),
    ],
  )
}

/// This resource's privacy status.
pub type PrivacyStatus {
  PrivacyStatusPublic
  PrivacyStatusUnlisted
  PrivacyStatusPrivate
}

pub fn privacy_status_to_string(value: PrivacyStatus) -> String {
  case value {
    PrivacyStatusPublic -> "public"
    PrivacyStatusUnlisted -> "unlisted"
    PrivacyStatusPrivate -> "private"
  }
}

pub fn privacy_status_decoder() -> Decoder(PrivacyStatus) {
  use value <- decode.then(decode.string)
  case value {
    "public" -> decode.success(PrivacyStatusPublic)
    "unlisted" -> decode.success(PrivacyStatusUnlisted)
    "private" -> decode.success(PrivacyStatusPrivate)
    _ -> decode.failure(PrivacyStatusPublic, "a valid PrivacyStatus")
  }
}