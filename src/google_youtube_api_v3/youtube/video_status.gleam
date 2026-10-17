//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Basic details about a video category, such as its localized title. Next Id: 20
pub type VideoStatus {
  VideoStatus(
    contains_synthetic_media: Option(Bool),
    embeddable: Option(Bool),
    failure_reason: Option(FailureReason),
    license: Option(License),
    made_for_kids: Option(Bool),
    privacy_status: Option(PrivacyStatus),
    public_stats_viewable: Option(Bool),
    publish_at: Option(String),
    rejection_reason: Option(RejectionReason),
    self_declared_made_for_kids: Option(Bool),
    upload_status: Option(UploadStatus),
  )
}

pub fn decoder() -> Decoder(VideoStatus) {
  use contains_synthetic_media <- decode.optional_field(
    "containsSyntheticMedia",
    option.None,
    decode.optional(decode.bool),
  )
  use embeddable <- decode.optional_field(
    "embeddable",
    option.None,
    decode.optional(decode.bool),
  )
  use failure_reason <- decode.optional_field(
    "failureReason",
    option.None,
    decode.optional(failure_reason_decoder()),
  )
  use license <- decode.optional_field(
    "license",
    option.None,
    decode.optional(license_decoder()),
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
  use public_stats_viewable <- decode.optional_field(
    "publicStatsViewable",
    option.None,
    decode.optional(decode.bool),
  )
  use publish_at <- decode.optional_field(
    "publishAt",
    option.None,
    decode.optional(decode.string),
  )
  use rejection_reason <- decode.optional_field(
    "rejectionReason",
    option.None,
    decode.optional(rejection_reason_decoder()),
  )
  use self_declared_made_for_kids <- decode.optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  use upload_status <- decode.optional_field(
    "uploadStatus",
    option.None,
    decode.optional(upload_status_decoder()),
  )
  decode.success(
    VideoStatus(
      contains_synthetic_media,
      embeddable,
      failure_reason,
      license,
      made_for_kids,
      privacy_status,
      public_stats_viewable,
      publish_at,
      rejection_reason,
      self_declared_made_for_kids,
      upload_status,
    ),
  )
}

pub fn to_json(value: VideoStatus) -> Json {
  json.object(
    [
      #(
        "containsSyntheticMedia",
        json.nullable(value.contains_synthetic_media, json.bool),
      ),
      #("embeddable", json.nullable(value.embeddable, json.bool)),
      #(
        "failureReason",
        json.nullable(
          value.failure_reason,
          fn(e)
          { json.string(failure_reason_to_string(e)) },
        ),
      ),
      #(
        "license",
        json.nullable(
          value.license,
          fn(e)
          { json.string(license_to_string(e)) },
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
        "publicStatsViewable",
        json.nullable(value.public_stats_viewable, json.bool),
      ),
      #("publishAt", json.nullable(value.publish_at, json.string)),
      #(
        "rejectionReason",
        json.nullable(
          value.rejection_reason,
          fn(e)
          { json.string(rejection_reason_to_string(e)) },
        ),
      ),
      #(
        "selfDeclaredMadeForKids",
        json.nullable(value.self_declared_made_for_kids, json.bool),
      ),
      #(
        "uploadStatus",
        json.nullable(
          value.upload_status,
          fn(e)
          { json.string(upload_status_to_string(e)) },
        ),
      ),
    ],
  )
}

/// This value explains why a video failed to upload. This property is only present if the `uploadStatus` property indicates that the upload failed.
pub type FailureReason {
  FailureReasonConversion
  FailureReasonInvalidFile
  FailureReasonEmptyFile
  FailureReasonTooSmall
  FailureReasonCodec
  FailureReasonUploadAborted
}

pub fn failure_reason_to_string(value: FailureReason) -> String {
  case value {
    FailureReasonConversion -> "conversion"
    FailureReasonInvalidFile -> "invalidFile"
    FailureReasonEmptyFile -> "emptyFile"
    FailureReasonTooSmall -> "tooSmall"
    FailureReasonCodec -> "codec"
    FailureReasonUploadAborted -> "uploadAborted"
  }
}

pub fn failure_reason_decoder() -> Decoder(FailureReason) {
  use value <- decode.then(decode.string)
  case value {
    "conversion" -> decode.success(FailureReasonConversion)
    "invalidFile" -> decode.success(FailureReasonInvalidFile)
    "emptyFile" -> decode.success(FailureReasonEmptyFile)
    "tooSmall" -> decode.success(FailureReasonTooSmall)
    "codec" -> decode.success(FailureReasonCodec)
    "uploadAborted" -> decode.success(FailureReasonUploadAborted)
    _ -> decode.failure(FailureReasonConversion, "a valid FailureReason")
  }
}

/// The video's license. @mutable youtube.videos.insert youtube.videos.update
pub type License {
  LicenseYoutube
  LicenseCreativeCommon
}

pub fn license_to_string(value: License) -> String {
  case value {
    LicenseYoutube -> "youtube"
    LicenseCreativeCommon -> "creativeCommon"
  }
}

pub fn license_decoder() -> Decoder(License) {
  use value <- decode.then(decode.string)
  case value {
    "youtube" -> decode.success(LicenseYoutube)
    "creativeCommon" -> decode.success(LicenseCreativeCommon)
    _ -> decode.failure(LicenseYoutube, "a valid License")
  }
}

/// The video's privacy status. In a `videos.insert` request, if you don't specify a value for this property, the uploaded video's privacy status defaults to `public`. Certain uploads might default to `private` based on creator account settings, as explained in the [YouTube Help Center](https://support.google.com/youtube/answer/157177). Videos uploaded from unverified API projects are not restricted to private viewing mode.
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

/// This value explains why YouTube rejected an uploaded video. This property is only present if the `uploadStatus` property indicates that the upload was rejected.
pub type RejectionReason {
  RejectionReasonCopyright
  RejectionReasonInappropriate
  RejectionReasonDuplicate
  RejectionReasonTermsOfUse
  RejectionReasonUploaderAccountSuspended
  RejectionReasonLength
  RejectionReasonClaim
  RejectionReasonUploaderAccountClosed
  RejectionReasonTrademark
  RejectionReasonLegal
}

pub fn rejection_reason_to_string(value: RejectionReason) -> String {
  case value {
    RejectionReasonCopyright -> "copyright"
    RejectionReasonInappropriate -> "inappropriate"
    RejectionReasonDuplicate -> "duplicate"
    RejectionReasonTermsOfUse -> "termsOfUse"
    RejectionReasonUploaderAccountSuspended -> "uploaderAccountSuspended"
    RejectionReasonLength -> "length"
    RejectionReasonClaim -> "claim"
    RejectionReasonUploaderAccountClosed -> "uploaderAccountClosed"
    RejectionReasonTrademark -> "trademark"
    RejectionReasonLegal -> "legal"
  }
}

pub fn rejection_reason_decoder() -> Decoder(RejectionReason) {
  use value <- decode.then(decode.string)
  case value {
    "copyright" -> decode.success(RejectionReasonCopyright)
    "inappropriate" -> decode.success(RejectionReasonInappropriate)
    "duplicate" -> decode.success(RejectionReasonDuplicate)
    "termsOfUse" -> decode.success(RejectionReasonTermsOfUse)
    "uploaderAccountSuspended" -> decode.success(
      RejectionReasonUploaderAccountSuspended,
    )
    "length" -> decode.success(RejectionReasonLength)
    "claim" -> decode.success(RejectionReasonClaim)
    "uploaderAccountClosed" -> decode.success(
      RejectionReasonUploaderAccountClosed,
    )
    "trademark" -> decode.success(RejectionReasonTrademark)
    "legal" -> decode.success(RejectionReasonLegal)
    _ -> decode.failure(RejectionReasonCopyright, "a valid RejectionReason")
  }
}

/// The status of the uploaded video.
pub type UploadStatus {
  UploadStatusUploaded
  UploadStatusProcessed
  UploadStatusFailed
  UploadStatusRejected
  UploadStatusDeleted
}

pub fn upload_status_to_string(value: UploadStatus) -> String {
  case value {
    UploadStatusUploaded -> "uploaded"
    UploadStatusProcessed -> "processed"
    UploadStatusFailed -> "failed"
    UploadStatusRejected -> "rejected"
    UploadStatusDeleted -> "deleted"
  }
}

pub fn upload_status_decoder() -> Decoder(UploadStatus) {
  use value <- decode.then(decode.string)
  case value {
    "uploaded" -> decode.success(UploadStatusUploaded)
    "processed" -> decode.success(UploadStatusProcessed)
    "failed" -> decode.success(UploadStatusFailed)
    "rejected" -> decode.success(UploadStatusRejected)
    "deleted" -> decode.success(UploadStatusDeleted)
    _ -> decode.failure(UploadStatusUploaded, "a valid UploadStatus")
  }
}