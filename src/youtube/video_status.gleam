//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option

/// Basic details about a video category, such as its localized title. Next Id: 20
pub type VideoStatus {
  VideoStatus(
    contains_synthetic_media: option.Option(Bool),
    embeddable: option.Option(Bool),
    failure_reason: option.Option(FailureReason),
    license: option.Option(License),
    made_for_kids: option.Option(Bool),
    privacy_status: option.Option(PrivacyStatus),
    public_stats_viewable: option.Option(Bool),
    publish_at: option.Option(String),
    rejection_reason: option.Option(RejectionReason),
    self_declared_made_for_kids: option.Option(Bool),
    upload_status: option.Option(UploadStatus),
  )
}

pub fn decoder() -> Decoder(VideoStatus) {
  use contains_synthetic_media <- optional_field(
    "containsSyntheticMedia",
    option.None,
    optional(bool),
  )
  use embeddable <- optional_field("embeddable", option.None, optional(bool))
  use failure_reason <- optional_field(
    "failureReason",
    option.None,
    optional(failure_reason_decoder()),
  )
  use license <- optional_field(
    "license",
    option.None,
    optional(license_decoder()),
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
  use public_stats_viewable <- optional_field(
    "publicStatsViewable",
    option.None,
    optional(bool),
  )
  use publish_at <- optional_field("publishAt", option.None, optional(string))
  use rejection_reason <- optional_field(
    "rejectionReason",
    option.None,
    optional(rejection_reason_decoder()),
  )
  use self_declared_made_for_kids <- optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    optional(bool),
  )
  use upload_status <- optional_field(
    "uploadStatus",
    option.None,
    optional(upload_status_decoder()),
  )
  success(
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
  use value <- then(string)
  case value {
    "conversion" -> success(FailureReasonConversion)
    "invalidFile" -> success(FailureReasonInvalidFile)
    "emptyFile" -> success(FailureReasonEmptyFile)
    "tooSmall" -> success(FailureReasonTooSmall)
    "codec" -> success(FailureReasonCodec)
    "uploadAborted" -> success(FailureReasonUploadAborted)
    _ -> failure(FailureReasonConversion, "a valid FailureReason")
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
  use value <- then(string)
  case value {
    "youtube" -> success(LicenseYoutube)
    "creativeCommon" -> success(LicenseCreativeCommon)
    _ -> failure(LicenseYoutube, "a valid License")
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
  use value <- then(string)
  case value {
    "public" -> success(PrivacyStatusPublic)
    "unlisted" -> success(PrivacyStatusUnlisted)
    "private" -> success(PrivacyStatusPrivate)
    _ -> failure(PrivacyStatusPublic, "a valid PrivacyStatus")
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
  use value <- then(string)
  case value {
    "copyright" -> success(RejectionReasonCopyright)
    "inappropriate" -> success(RejectionReasonInappropriate)
    "duplicate" -> success(RejectionReasonDuplicate)
    "termsOfUse" -> success(RejectionReasonTermsOfUse)
    "uploaderAccountSuspended" -> success(
      RejectionReasonUploaderAccountSuspended,
    )
    "length" -> success(RejectionReasonLength)
    "claim" -> success(RejectionReasonClaim)
    "uploaderAccountClosed" -> success(RejectionReasonUploaderAccountClosed)
    "trademark" -> success(RejectionReasonTrademark)
    "legal" -> success(RejectionReasonLegal)
    _ -> failure(RejectionReasonCopyright, "a valid RejectionReason")
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
  use value <- then(string)
  case value {
    "uploaded" -> success(UploadStatusUploaded)
    "processed" -> success(UploadStatusProcessed)
    "failed" -> success(UploadStatusFailed)
    "rejected" -> success(UploadStatusRejected)
    "deleted" -> success(UploadStatusDeleted)
    _ -> failure(UploadStatusUploaded, "a valid UploadStatus")
  }
}