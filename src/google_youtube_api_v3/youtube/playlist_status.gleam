//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type PlaylistStatus {
  PlaylistStatus(
    podcast_status: Option(PodcastStatus),
    privacy_status: Option(PrivacyStatus),
  )
}

pub fn decoder() -> Decoder(PlaylistStatus) {
  use podcast_status <- decode.optional_field(
    "podcastStatus",
    option.None,
    decode.optional(podcast_status_decoder()),
  )
  use privacy_status <- decode.optional_field(
    "privacyStatus",
    option.None,
    decode.optional(privacy_status_decoder()),
  )
  decode.success(PlaylistStatus(podcast_status, privacy_status))
}

pub fn to_json(value: PlaylistStatus) -> Json {
  json.object([
    #(
      "podcastStatus",
      json.nullable(value.podcast_status, fn(e) {
        json.string(podcast_status_to_string(e))
      }),
    ),
    #(
      "privacyStatus",
      json.nullable(value.privacy_status, fn(e) {
        json.string(privacy_status_to_string(e))
      }),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "enabled" -> decode.success(PodcastStatusEnabled)
    "disabled" -> decode.success(PodcastStatusDisabled)
    _ -> decode.failure(PodcastStatusEnabled, "a valid PodcastStatus")
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
  use value <- decode.then(decode.string)
  case value {
    "public" -> decode.success(PrivacyStatusPublic)
    "unlisted" -> decode.success(PrivacyStatusUnlisted)
    "private" -> decode.success(PrivacyStatusPrivate)
    _ -> decode.failure(PrivacyStatusPublic, "a valid PrivacyStatus")
  }
}
