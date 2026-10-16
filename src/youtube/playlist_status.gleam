//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

pub type PlaylistStatus {
  PlaylistStatus(
    podcast_status: option.Option(PodcastStatus),
    privacy_status: option.Option(PrivacyStatus),
  )
}

pub fn decoder() -> Decoder(PlaylistStatus) {
  use podcast_status <- optional_field(
    "podcastStatus",
    option.None,
    optional(podcast_status_decoder()),
  )
  use privacy_status <- optional_field(
    "privacyStatus",
    option.None,
    optional(privacy_status_decoder()),
  )
  success(PlaylistStatus(podcast_status, privacy_status))
}

/// The playlist's podcast status.
pub type PodcastStatus {
  PodcastStatusEnabled
  PodcastStatusDisabled
}

pub fn podcast_status_to_string(value: PodcastStatus) -> String {
  case value {
    PodcastStatusEnabled -> "enabled"
    PodcastStatusDisabled -> "disabled"
  }
}

pub fn podcast_status_decoder() -> Decoder(PodcastStatus) {
  use value <- then(string)
  case value {
    "enabled" -> success(PodcastStatusEnabled)
    "disabled" -> success(PodcastStatusDisabled)
    _ -> failure(PodcastStatusEnabled, "a valid PodcastStatus")
  }
}

/// The playlist's privacy status.
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