//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/ingestion_info.{type IngestionInfo}

/// Brief description of the live stream cdn settings.
pub type CdnSettings {
  CdnSettings(
    format: option.Option(String),
    frame_rate: option.Option(FrameRate),
    ingestion_info: option.Option(IngestionInfo),
    ingestion_type: option.Option(IngestionType),
    resolution: option.Option(Resolution),
  )
}

pub fn decoder() -> Decoder(CdnSettings) {
  use format <- optional_field("format", option.None, optional(string))
  use frame_rate <- optional_field(
    "frameRate",
    option.None,
    optional(frame_rate_decoder()),
  )
  use ingestion_info <- optional_field(
    "ingestionInfo",
    option.None,
    optional(ingestion_info.decoder()),
  )
  use ingestion_type <- optional_field(
    "ingestionType",
    option.None,
    optional(ingestion_type_decoder()),
  )
  use resolution <- optional_field(
    "resolution",
    option.None,
    optional(resolution_decoder()),
  )
  success(
    CdnSettings(format, frame_rate, ingestion_info, ingestion_type, resolution),
  )
}

/// The frame rate of the inbound video data.
pub type FrameRate {
  FrameRateValue30fps
  FrameRateValue60fps
  FrameRateVariable
}

pub fn frame_rate_to_string(value: FrameRate) -> String {
  case value {
    FrameRateValue30fps -> "30fps"
    FrameRateValue60fps -> "60fps"
    FrameRateVariable -> "variable"
  }
}

pub fn frame_rate_decoder() -> Decoder(FrameRate) {
  use value <- then(string)
  case value {
    "30fps" -> success(FrameRateValue30fps)
    "60fps" -> success(FrameRateValue60fps)
    "variable" -> success(FrameRateVariable)
    _ -> failure(FrameRateValue30fps, "a valid FrameRate")
  }
}

///  The method or protocol used to transmit the video stream.
pub type IngestionType {
  IngestionTypeRtmp
  IngestionTypeDash
  IngestionTypeWebrtc
  IngestionTypeHls
}

pub fn ingestion_type_to_string(value: IngestionType) -> String {
  case value {
    IngestionTypeRtmp -> "rtmp"
    IngestionTypeDash -> "dash"
    IngestionTypeWebrtc -> "webrtc"
    IngestionTypeHls -> "hls"
  }
}

pub fn ingestion_type_decoder() -> Decoder(IngestionType) {
  use value <- then(string)
  case value {
    "rtmp" -> success(IngestionTypeRtmp)
    "dash" -> success(IngestionTypeDash)
    "webrtc" -> success(IngestionTypeWebrtc)
    "hls" -> success(IngestionTypeHls)
    _ -> failure(IngestionTypeRtmp, "a valid IngestionType")
  }
}

/// The resolution of the inbound video data.
pub type Resolution {
  ResolutionValue240p
  ResolutionValue360p
  ResolutionValue480p
  ResolutionValue720p
  ResolutionValue1080p
  ResolutionValue1440p
  ResolutionValue2160p
  ResolutionVariable
}

pub fn resolution_to_string(value: Resolution) -> String {
  case value {
    ResolutionValue240p -> "240p"
    ResolutionValue360p -> "360p"
    ResolutionValue480p -> "480p"
    ResolutionValue720p -> "720p"
    ResolutionValue1080p -> "1080p"
    ResolutionValue1440p -> "1440p"
    ResolutionValue2160p -> "2160p"
    ResolutionVariable -> "variable"
  }
}

pub fn resolution_decoder() -> Decoder(Resolution) {
  use value <- then(string)
  case value {
    "240p" -> success(ResolutionValue240p)
    "360p" -> success(ResolutionValue360p)
    "480p" -> success(ResolutionValue480p)
    "720p" -> success(ResolutionValue720p)
    "1080p" -> success(ResolutionValue1080p)
    "1440p" -> success(ResolutionValue1440p)
    "2160p" -> success(ResolutionValue2160p)
    "variable" -> success(ResolutionVariable)
    _ -> failure(ResolutionValue240p, "a valid Resolution")
  }
}