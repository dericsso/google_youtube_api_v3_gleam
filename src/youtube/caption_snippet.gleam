//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option

/// Basic details about a caption track, such as its language and name.
pub type CaptionSnippet {
  CaptionSnippet(
    audio_track_type: option.Option(AudioTrackType),
    failure_reason: option.Option(FailureReason),
    is_auto_synced: option.Option(Bool),
    is_cc: option.Option(Bool),
    is_draft: option.Option(Bool),
    is_easy_reader: option.Option(Bool),
    is_large: option.Option(Bool),
    language: option.Option(String),
    last_updated: option.Option(String),
    name: option.Option(String),
    status: option.Option(Status),
    track_kind: option.Option(TrackKind),
    video_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(CaptionSnippet) {
  use audio_track_type <- optional_field(
    "audioTrackType",
    option.None,
    optional(audio_track_type_decoder()),
  )
  use failure_reason <- optional_field(
    "failureReason",
    option.None,
    optional(failure_reason_decoder()),
  )
  use is_auto_synced <- optional_field(
    "isAutoSynced",
    option.None,
    optional(bool),
  )
  use is_cc <- optional_field("isCC", option.None, optional(bool))
  use is_draft <- optional_field("isDraft", option.None, optional(bool))
  use is_easy_reader <- optional_field(
    "isEasyReader",
    option.None,
    optional(bool),
  )
  use is_large <- optional_field("isLarge", option.None, optional(bool))
  use language <- optional_field("language", option.None, optional(string))
  use last_updated <- optional_field(
    "lastUpdated",
    option.None,
    optional(string),
  )
  use name <- optional_field("name", option.None, optional(string))
  use status <- optional_field(
    "status",
    option.None,
    optional(status_decoder()),
  )
  use track_kind <- optional_field(
    "trackKind",
    option.None,
    optional(track_kind_decoder()),
  )
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(
    CaptionSnippet(
      audio_track_type,
      failure_reason,
      is_auto_synced,
      is_cc,
      is_draft,
      is_easy_reader,
      is_large,
      language,
      last_updated,
      name,
      status,
      track_kind,
      video_id,
    ),
  )
}

/// The type of audio track associated with the caption track.
pub type AudioTrackType {
  AudioTrackTypeUnknown
  AudioTrackTypePrimary
  AudioTrackTypeCommentary
  AudioTrackTypeDescriptive
}

pub fn audio_track_type_to_string(value: AudioTrackType) -> String {
  case value {
    AudioTrackTypeUnknown -> "unknown"
    AudioTrackTypePrimary -> "primary"
    AudioTrackTypeCommentary -> "commentary"
    AudioTrackTypeDescriptive -> "descriptive"
  }
}

pub fn audio_track_type_decoder() -> Decoder(AudioTrackType) {
  use value <- then(string)
  case value {
    "unknown" -> success(AudioTrackTypeUnknown)
    "primary" -> success(AudioTrackTypePrimary)
    "commentary" -> success(AudioTrackTypeCommentary)
    "descriptive" -> success(AudioTrackTypeDescriptive)
    _ -> failure(AudioTrackTypeUnknown, "a valid AudioTrackType")
  }
}

/// The reason that YouTube failed to process the caption track. This property is only present if the state property's value is failed.
pub type FailureReason {
  FailureReasonUnknownFormat
  FailureReasonUnsupportedFormat
  FailureReasonProcessingFailed
}

pub fn failure_reason_to_string(value: FailureReason) -> String {
  case value {
    FailureReasonUnknownFormat -> "unknownFormat"
    FailureReasonUnsupportedFormat -> "unsupportedFormat"
    FailureReasonProcessingFailed -> "processingFailed"
  }
}

pub fn failure_reason_decoder() -> Decoder(FailureReason) {
  use value <- then(string)
  case value {
    "unknownFormat" -> success(FailureReasonUnknownFormat)
    "unsupportedFormat" -> success(FailureReasonUnsupportedFormat)
    "processingFailed" -> success(FailureReasonProcessingFailed)
    _ -> failure(FailureReasonUnknownFormat, "a valid FailureReason")
  }
}

/// The caption track's status.
pub type Status {
  StatusServing
  StatusSyncing
  StatusFailed
}

pub fn status_to_string(value: Status) -> String {
  case value {
    StatusServing -> "serving"
    StatusSyncing -> "syncing"
    StatusFailed -> "failed"
  }
}

pub fn status_decoder() -> Decoder(Status) {
  use value <- then(string)
  case value {
    "serving" -> success(StatusServing)
    "syncing" -> success(StatusSyncing)
    "failed" -> success(StatusFailed)
    _ -> failure(StatusServing, "a valid Status")
  }
}

/// The caption track's type.
pub type TrackKind {
  TrackKindStandard
  TrackKindAsr
  TrackKindForced
}

pub fn track_kind_to_string(value: TrackKind) -> String {
  case value {
    TrackKindStandard -> "standard"
    TrackKindAsr -> "ASR"
    TrackKindForced -> "forced"
  }
}

pub fn track_kind_decoder() -> Decoder(TrackKind) {
  use value <- then(string)
  case value {
    "standard" -> success(TrackKindStandard)
    "ASR" -> success(TrackKindAsr)
    "forced" -> success(TrackKindForced)
    _ -> failure(TrackKindStandard, "a valid TrackKind")
  }
}