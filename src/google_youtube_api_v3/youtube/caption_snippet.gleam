//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Basic details about a caption track, such as its language and name.
pub type CaptionSnippet {
  CaptionSnippet(
    audio_track_type: Option(AudioTrackType),
    failure_reason: Option(FailureReason),
    is_auto_synced: Option(Bool),
    is_cc: Option(Bool),
    is_draft: Option(Bool),
    is_easy_reader: Option(Bool),
    is_large: Option(Bool),
    language: Option(String),
    last_updated: Option(String),
    name: Option(String),
    status: Option(Status),
    track_kind: Option(TrackKind),
    video_id: Option(String),
  )
}

pub fn decoder() -> Decoder(CaptionSnippet) {
  use audio_track_type <- decode.optional_field(
    "audioTrackType",
    option.None,
    decode.optional(audio_track_type_decoder()),
  )
  use failure_reason <- decode.optional_field(
    "failureReason",
    option.None,
    decode.optional(failure_reason_decoder()),
  )
  use is_auto_synced <- decode.optional_field(
    "isAutoSynced",
    option.None,
    decode.optional(decode.bool),
  )
  use is_cc <- decode.optional_field(
    "isCC",
    option.None,
    decode.optional(decode.bool),
  )
  use is_draft <- decode.optional_field(
    "isDraft",
    option.None,
    decode.optional(decode.bool),
  )
  use is_easy_reader <- decode.optional_field(
    "isEasyReader",
    option.None,
    decode.optional(decode.bool),
  )
  use is_large <- decode.optional_field(
    "isLarge",
    option.None,
    decode.optional(decode.bool),
  )
  use language <- decode.optional_field(
    "language",
    option.None,
    decode.optional(decode.string),
  )
  use last_updated <- decode.optional_field(
    "lastUpdated",
    option.None,
    decode.optional(decode.string),
  )
  use name <- decode.optional_field(
    "name",
    option.None,
    decode.optional(decode.string),
  )
  use status <- decode.optional_field(
    "status",
    option.None,
    decode.optional(status_decoder()),
  )
  use track_kind <- decode.optional_field(
    "trackKind",
    option.None,
    decode.optional(track_kind_decoder()),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(
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

pub fn to_json(value: CaptionSnippet) -> Json {
  json.object(
    [
      #(
        "audioTrackType",
        json.nullable(
          value.audio_track_type,
          fn(e)
          { json.string(audio_track_type_to_string(e)) },
        ),
      ),
      #(
        "failureReason",
        json.nullable(
          value.failure_reason,
          fn(e)
          { json.string(failure_reason_to_string(e)) },
        ),
      ),
      #("isAutoSynced", json.nullable(value.is_auto_synced, json.bool)),
      #("isCC", json.nullable(value.is_cc, json.bool)),
      #("isDraft", json.nullable(value.is_draft, json.bool)),
      #("isEasyReader", json.nullable(value.is_easy_reader, json.bool)),
      #("isLarge", json.nullable(value.is_large, json.bool)),
      #("language", json.nullable(value.language, json.string)),
      #("lastUpdated", json.nullable(value.last_updated, json.string)),
      #("name", json.nullable(value.name, json.string)),
      #(
        "status",
        json.nullable(value.status, fn(e) { json.string(status_to_string(e)) }),
      ),
      #(
        "trackKind",
        json.nullable(
          value.track_kind,
          fn(e)
          { json.string(track_kind_to_string(e)) },
        ),
      ),
      #("videoId", json.nullable(value.video_id, json.string)),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "unknown" -> decode.success(AudioTrackTypeUnknown)
    "primary" -> decode.success(AudioTrackTypePrimary)
    "commentary" -> decode.success(AudioTrackTypeCommentary)
    "descriptive" -> decode.success(AudioTrackTypeDescriptive)
    _ -> decode.failure(AudioTrackTypeUnknown, "a valid AudioTrackType")
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
  use value <- decode.then(decode.string)
  case value {
    "unknownFormat" -> decode.success(FailureReasonUnknownFormat)
    "unsupportedFormat" -> decode.success(FailureReasonUnsupportedFormat)
    "processingFailed" -> decode.success(FailureReasonProcessingFailed)
    _ -> decode.failure(FailureReasonUnknownFormat, "a valid FailureReason")
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
  use value <- decode.then(decode.string)
  case value {
    "serving" -> decode.success(StatusServing)
    "syncing" -> decode.success(StatusSyncing)
    "failed" -> decode.success(StatusFailed)
    _ -> decode.failure(StatusServing, "a valid Status")
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
  use value <- decode.then(decode.string)
  case value {
    "standard" -> decode.success(TrackKindStandard)
    "ASR" -> decode.success(TrackKindAsr)
    "forced" -> decode.success(TrackKindForced)
    _ -> decode.failure(TrackKindStandard, "a valid TrackKind")
  }
}