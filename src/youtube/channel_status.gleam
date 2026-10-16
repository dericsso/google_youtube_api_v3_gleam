//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option

/// JSON template for the status part of a channel.
pub type ChannelStatus {
  ChannelStatus(
    is_channel_monetization_enabled: option.Option(Bool),
    is_linked: option.Option(Bool),
    long_uploads_status: option.Option(LongUploadsStatus),
    made_for_kids: option.Option(Bool),
    privacy_status: option.Option(PrivacyStatus),
    self_declared_made_for_kids: option.Option(Bool),
  )
}

pub fn decoder() -> Decoder(ChannelStatus) {
  use is_channel_monetization_enabled <- optional_field(
    "isChannelMonetizationEnabled",
    option.None,
    optional(bool),
  )
  use is_linked <- optional_field("isLinked", option.None, optional(bool))
  use long_uploads_status <- optional_field(
    "longUploadsStatus",
    option.None,
    optional(long_uploads_status_decoder()),
  )
  use made_for_kids <- optional_field(
    "madeForKids",
    option.None,
    optional(bool),
  )
  use privacy_status <- optional_field(
    "privacyStatus",
    option.None,
    optional(privacy_status_decoder()),
  )
  use self_declared_made_for_kids <- optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    optional(bool),
  )
  success(
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
  use value <- then(string)
  case value {
    "longUploadsUnspecified" -> success(LongUploadsStatusLongUploadsUnspecified)
    "allowed" -> success(LongUploadsStatusAllowed)
    "eligible" -> success(LongUploadsStatusEligible)
    "disallowed" -> success(LongUploadsStatusDisallowed)
    _ -> failure(
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
  use value <- then(string)
  case value {
    "public" -> success(PrivacyStatusPublic)
    "unlisted" -> success(PrivacyStatusUnlisted)
    "private" -> success(PrivacyStatusPrivate)
    _ -> failure(PrivacyStatusPublic, "a valid PrivacyStatus")
  }
}