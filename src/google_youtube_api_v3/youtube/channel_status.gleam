//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// JSON template for the status part of a channel.
pub type ChannelStatus {
  ChannelStatus(
    is_channel_monetization_enabled: Option(Bool),
    is_linked: Option(Bool),
    long_uploads_status: Option(LongUploadsStatus),
    made_for_kids: Option(Bool),
    privacy_status: Option(PrivacyStatus),
    self_declared_made_for_kids: Option(Bool),
  )
}

pub fn decoder() -> Decoder(ChannelStatus) {
  use is_channel_monetization_enabled <- decode.optional_field(
    "isChannelMonetizationEnabled",
    option.None,
    decode.optional(decode.bool),
  )
  use is_linked <- decode.optional_field(
    "isLinked",
    option.None,
    decode.optional(decode.bool),
  )
  use long_uploads_status <- decode.optional_field(
    "longUploadsStatus",
    option.None,
    decode.optional(long_uploads_status_decoder()),
  )
  use made_for_kids <- decode.optional_field(
    "madeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  use privacy_status <- decode.optional_field(
    "privacyStatus",
    option.None,
    decode.optional(privacy_status_decoder()),
  )
  use self_declared_made_for_kids <- decode.optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(
    ChannelStatus(
      is_channel_monetization_enabled,
      is_linked,
      long_uploads_status,
      made_for_kids,
      privacy_status,
      self_declared_made_for_kids,
    ),
  )
}

pub fn to_json(value: ChannelStatus) -> Json {
  json.object(
    [
      #(
        "isChannelMonetizationEnabled",
        json.nullable(value.is_channel_monetization_enabled, json.bool),
      ),
      #("isLinked", json.nullable(value.is_linked, json.bool)),
      #(
        "longUploadsStatus",
        json.nullable(
          value.long_uploads_status,
          fn(e)
          { json.string(long_uploads_status_to_string(e)) },
        ),
      ),
      #("madeForKids", json.nullable(value.made_for_kids, json.bool)),
      #(
        "privacyStatus",
        json.nullable(
          value.privacy_status,
          fn(e)
          { json.string(privacy_status_to_string(e)) },
        ),
      ),
      #(
        "selfDeclaredMadeForKids",
        json.nullable(value.self_declared_made_for_kids, json.bool),
      ),
    ],
  )
}

/// The long uploads status of this channel. See https://support.google.com/youtube/answer/71673 for more information.
pub type LongUploadsStatus {
  LongUploadsStatusLongUploadsUnspecified
  LongUploadsStatusAllowed
  LongUploadsStatusEligible
  LongUploadsStatusDisallowed
}

pub fn long_uploads_status_to_string(value: LongUploadsStatus) -> String {
  case value {
    LongUploadsStatusLongUploadsUnspecified -> "longUploadsUnspecified"
    LongUploadsStatusAllowed -> "allowed"
    LongUploadsStatusEligible -> "eligible"
    LongUploadsStatusDisallowed -> "disallowed"
  }
}

pub fn long_uploads_status_decoder() -> Decoder(LongUploadsStatus) {
  use value <- decode.then(decode.string)
  case value {
    "longUploadsUnspecified" -> decode.success(
      LongUploadsStatusLongUploadsUnspecified,
    )
    "allowed" -> decode.success(LongUploadsStatusAllowed)
    "eligible" -> decode.success(LongUploadsStatusEligible)
    "disallowed" -> decode.success(LongUploadsStatusDisallowed)
    _ -> decode.failure(
      LongUploadsStatusLongUploadsUnspecified,
      "a valid LongUploadsStatus",
    )
  }
}

/// Privacy status of the channel.
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