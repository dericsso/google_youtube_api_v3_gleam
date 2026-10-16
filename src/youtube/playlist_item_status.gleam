//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

/// Information about the playlist item's privacy status.
pub type PlaylistItemStatus {
  PlaylistItemStatus(privacy_status: option.Option(PrivacyStatus))
}

pub fn decoder() -> Decoder(PlaylistItemStatus) {
  use privacy_status <- optional_field(
    "privacyStatus",
    option.None,
    optional(privacy_status_decoder()),
  )
  success(PlaylistItemStatus(privacy_status))
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
  use value <- then(string)
  case value {
    "public" -> success(PrivacyStatusPublic)
    "unlisted" -> success(PrivacyStatusUnlisted)
    "private" -> success(PrivacyStatusPrivate)
    _ -> failure(PrivacyStatusPublic, "a valid PrivacyStatus")
  }
}