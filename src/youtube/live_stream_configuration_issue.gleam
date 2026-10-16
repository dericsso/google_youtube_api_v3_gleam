//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type LiveStreamConfigurationIssue {
  LiveStreamConfigurationIssue(
    description: Option(String),
    reason: Option(String),
    severity: Option(Severity),
    type_: Option(Type),
  )
}

pub fn decoder() -> Decoder(LiveStreamConfigurationIssue) {
  use description <- decode.optional_field(
    "description",
    option.None,
    decode.optional(decode.string),
  )
  use reason <- decode.optional_field(
    "reason",
    option.None,
    decode.optional(decode.string),
  )
  use severity <- decode.optional_field(
    "severity",
    option.None,
    decode.optional(severity_decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(LiveStreamConfigurationIssue(
    description,
    reason,
    severity,
    type_,
  ))
}

pub fn to_json(value: LiveStreamConfigurationIssue) -> Json {
  json.object([
    #("description", json.nullable(value.description, json.string)),
    #("reason", json.nullable(value.reason, json.string)),
    #(
      "severity",
      json.nullable(value.severity, fn(e) { json.string(severity_to_string(e)) }),
    ),
    #(
      "type",
      json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
    ),
  ])
}

/// How severe this issue is to the stream.
pub type Severity {
  SeverityInfo
  SeverityWarning
  SeverityError
}

pub fn severity_to_string(value: Severity) -> String {
  case value {
    SeverityInfo -> "info"
    SeverityWarning -> "warning"
    SeverityError -> "error"
  }
}

pub fn severity_decoder() -> Decoder(Severity) {
  use value <- decode.then(decode.string)
  case value {
    "info" -> decode.success(SeverityInfo)
    "warning" -> decode.success(SeverityWarning)
    "error" -> decode.success(SeverityError)
    _ -> decode.failure(SeverityInfo, "a valid Severity")
  }
}

/// The kind of error happening.
pub type Type {
  TypeGopSizeOver
  TypeGopSizeLong
  TypeGopSizeShort
  TypeOpenGop
  TypeBadContainer
  TypeAudioBitrateHigh
  TypeAudioBitrateLow
  TypeAudioSampleRate
  TypeBitrateHigh
  TypeBitrateLow
  TypeAudioCodec
  TypeVideoCodec
  TypeNoAudioStream
  TypeNoVideoStream
  TypeMultipleVideoStreams
  TypeMultipleAudioStreams
  TypeAudioTooManyChannels
  TypeInterlacedVideo
  TypeFrameRateHigh
  TypeResolutionMismatch
  TypeVideoCodecMismatch
  TypeVideoInterlaceMismatch
  TypeVideoProfileMismatch
  TypeVideoBitrateMismatch
  TypeFramerateMismatch
  TypeGopMismatch
  TypeAudioSampleRateMismatch
  TypeAudioStereoMismatch
  TypeAudioCodecMismatch
  TypeAudioBitrateMismatch
  TypeVideoResolutionSuboptimal
  TypeVideoResolutionUnsupported
  TypeVideoIngestionStarved
  TypeVideoIngestionFasterThanRealtime
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeGopSizeOver -> "gopSizeOver"
    TypeGopSizeLong -> "gopSizeLong"
    TypeGopSizeShort -> "gopSizeShort"
    TypeOpenGop -> "openGop"
    TypeBadContainer -> "badContainer"
    TypeAudioBitrateHigh -> "audioBitrateHigh"
    TypeAudioBitrateLow -> "audioBitrateLow"
    TypeAudioSampleRate -> "audioSampleRate"
    TypeBitrateHigh -> "bitrateHigh"
    TypeBitrateLow -> "bitrateLow"
    TypeAudioCodec -> "audioCodec"
    TypeVideoCodec -> "videoCodec"
    TypeNoAudioStream -> "noAudioStream"
    TypeNoVideoStream -> "noVideoStream"
    TypeMultipleVideoStreams -> "multipleVideoStreams"
    TypeMultipleAudioStreams -> "multipleAudioStreams"
    TypeAudioTooManyChannels -> "audioTooManyChannels"
    TypeInterlacedVideo -> "interlacedVideo"
    TypeFrameRateHigh -> "frameRateHigh"
    TypeResolutionMismatch -> "resolutionMismatch"
    TypeVideoCodecMismatch -> "videoCodecMismatch"
    TypeVideoInterlaceMismatch -> "videoInterlaceMismatch"
    TypeVideoProfileMismatch -> "videoProfileMismatch"
    TypeVideoBitrateMismatch -> "videoBitrateMismatch"
    TypeFramerateMismatch -> "framerateMismatch"
    TypeGopMismatch -> "gopMismatch"
    TypeAudioSampleRateMismatch -> "audioSampleRateMismatch"
    TypeAudioStereoMismatch -> "audioStereoMismatch"
    TypeAudioCodecMismatch -> "audioCodecMismatch"
    TypeAudioBitrateMismatch -> "audioBitrateMismatch"
    TypeVideoResolutionSuboptimal -> "videoResolutionSuboptimal"
    TypeVideoResolutionUnsupported -> "videoResolutionUnsupported"
    TypeVideoIngestionStarved -> "videoIngestionStarved"
    TypeVideoIngestionFasterThanRealtime -> "videoIngestionFasterThanRealtime"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- decode.then(decode.string)
  case value {
    "gopSizeOver" -> decode.success(TypeGopSizeOver)
    "gopSizeLong" -> decode.success(TypeGopSizeLong)
    "gopSizeShort" -> decode.success(TypeGopSizeShort)
    "openGop" -> decode.success(TypeOpenGop)
    "badContainer" -> decode.success(TypeBadContainer)
    "audioBitrateHigh" -> decode.success(TypeAudioBitrateHigh)
    "audioBitrateLow" -> decode.success(TypeAudioBitrateLow)
    "audioSampleRate" -> decode.success(TypeAudioSampleRate)
    "bitrateHigh" -> decode.success(TypeBitrateHigh)
    "bitrateLow" -> decode.success(TypeBitrateLow)
    "audioCodec" -> decode.success(TypeAudioCodec)
    "videoCodec" -> decode.success(TypeVideoCodec)
    "noAudioStream" -> decode.success(TypeNoAudioStream)
    "noVideoStream" -> decode.success(TypeNoVideoStream)
    "multipleVideoStreams" -> decode.success(TypeMultipleVideoStreams)
    "multipleAudioStreams" -> decode.success(TypeMultipleAudioStreams)
    "audioTooManyChannels" -> decode.success(TypeAudioTooManyChannels)
    "interlacedVideo" -> decode.success(TypeInterlacedVideo)
    "frameRateHigh" -> decode.success(TypeFrameRateHigh)
    "resolutionMismatch" -> decode.success(TypeResolutionMismatch)
    "videoCodecMismatch" -> decode.success(TypeVideoCodecMismatch)
    "videoInterlaceMismatch" -> decode.success(TypeVideoInterlaceMismatch)
    "videoProfileMismatch" -> decode.success(TypeVideoProfileMismatch)
    "videoBitrateMismatch" -> decode.success(TypeVideoBitrateMismatch)
    "framerateMismatch" -> decode.success(TypeFramerateMismatch)
    "gopMismatch" -> decode.success(TypeGopMismatch)
    "audioSampleRateMismatch" -> decode.success(TypeAudioSampleRateMismatch)
    "audioStereoMismatch" -> decode.success(TypeAudioStereoMismatch)
    "audioCodecMismatch" -> decode.success(TypeAudioCodecMismatch)
    "audioBitrateMismatch" -> decode.success(TypeAudioBitrateMismatch)
    "videoResolutionSuboptimal" -> decode.success(TypeVideoResolutionSuboptimal)
    "videoResolutionUnsupported" ->
      decode.success(TypeVideoResolutionUnsupported)
    "videoIngestionStarved" -> decode.success(TypeVideoIngestionStarved)
    "videoIngestionFasterThanRealtime" ->
      decode.success(TypeVideoIngestionFasterThanRealtime)
    _ -> decode.failure(TypeGopSizeOver, "a valid Type")
  }
}
