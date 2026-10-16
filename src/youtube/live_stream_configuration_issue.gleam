//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option

pub type LiveStreamConfigurationIssue {
  LiveStreamConfigurationIssue(
    description: option.Option(String),
    reason: option.Option(String),
    severity: option.Option(Severity),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(LiveStreamConfigurationIssue) {
  use description <- optional_field(
    "description",
    option.None,
    optional(string),
  )
  use reason <- optional_field("reason", option.None, optional(string))
  use severity <- optional_field(
    "severity",
    option.None,
    optional(severity_decoder()),
  )
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(LiveStreamConfigurationIssue(description, reason, severity, type_))
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
  use value <- then(string)
  case value {
    "info" -> success(SeverityInfo)
    "warning" -> success(SeverityWarning)
    "error" -> success(SeverityError)
    _ -> failure(SeverityInfo, "a valid Severity")
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
  use value <- then(string)
  case value {
    "gopSizeOver" -> success(TypeGopSizeOver)
    "gopSizeLong" -> success(TypeGopSizeLong)
    "gopSizeShort" -> success(TypeGopSizeShort)
    "openGop" -> success(TypeOpenGop)
    "badContainer" -> success(TypeBadContainer)
    "audioBitrateHigh" -> success(TypeAudioBitrateHigh)
    "audioBitrateLow" -> success(TypeAudioBitrateLow)
    "audioSampleRate" -> success(TypeAudioSampleRate)
    "bitrateHigh" -> success(TypeBitrateHigh)
    "bitrateLow" -> success(TypeBitrateLow)
    "audioCodec" -> success(TypeAudioCodec)
    "videoCodec" -> success(TypeVideoCodec)
    "noAudioStream" -> success(TypeNoAudioStream)
    "noVideoStream" -> success(TypeNoVideoStream)
    "multipleVideoStreams" -> success(TypeMultipleVideoStreams)
    "multipleAudioStreams" -> success(TypeMultipleAudioStreams)
    "audioTooManyChannels" -> success(TypeAudioTooManyChannels)
    "interlacedVideo" -> success(TypeInterlacedVideo)
    "frameRateHigh" -> success(TypeFrameRateHigh)
    "resolutionMismatch" -> success(TypeResolutionMismatch)
    "videoCodecMismatch" -> success(TypeVideoCodecMismatch)
    "videoInterlaceMismatch" -> success(TypeVideoInterlaceMismatch)
    "videoProfileMismatch" -> success(TypeVideoProfileMismatch)
    "videoBitrateMismatch" -> success(TypeVideoBitrateMismatch)
    "framerateMismatch" -> success(TypeFramerateMismatch)
    "gopMismatch" -> success(TypeGopMismatch)
    "audioSampleRateMismatch" -> success(TypeAudioSampleRateMismatch)
    "audioStereoMismatch" -> success(TypeAudioStereoMismatch)
    "audioCodecMismatch" -> success(TypeAudioCodecMismatch)
    "audioBitrateMismatch" -> success(TypeAudioBitrateMismatch)
    "videoResolutionSuboptimal" -> success(TypeVideoResolutionSuboptimal)
    "videoResolutionUnsupported" -> success(TypeVideoResolutionUnsupported)
    "videoIngestionStarved" -> success(TypeVideoIngestionStarved)
    "videoIngestionFasterThanRealtime" -> success(
      TypeVideoIngestionFasterThanRealtime,
    )
    _ -> failure(TypeGopSizeOver, "a valid Type")
  }
}