//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/ingestion_info.{type IngestionInfo}

/// Brief description of the live stream cdn settings.
pub type CdnSettings {
  CdnSettings(
    format: Option(String),
    frame_rate: Option(FrameRate),
    ingestion_info: Option(IngestionInfo),
    ingestion_type: Option(IngestionType),
    resolution: Option(Resolution),
  )
}

pub fn decoder() -> Decoder(CdnSettings) {
  use format <- decode.optional_field(
    "format",
    option.None,
    decode.optional(decode.string),
  )
  use frame_rate <- decode.optional_field(
    "frameRate",
    option.None,
    decode.optional(frame_rate_decoder()),
  )
  use ingestion_info <- decode.optional_field(
    "ingestionInfo",
    option.None,
    decode.optional(ingestion_info.decoder()),
  )
  use ingestion_type <- decode.optional_field(
    "ingestionType",
    option.None,
    decode.optional(ingestion_type_decoder()),
  )
  use resolution <- decode.optional_field(
    "resolution",
    option.None,
    decode.optional(resolution_decoder()),
  )
  decode.success(CdnSettings(
    format,
    frame_rate,
    ingestion_info,
    ingestion_type,
    resolution,
  ))
}

pub fn to_json(value: CdnSettings) -> Json {
  json.object([
    #("format", json.nullable(value.format, json.string)),
    #(
      "frameRate",
      json.nullable(value.frame_rate, fn(e) {
        json.string(frame_rate_to_string(e))
      }),
    ),
    #(
      "ingestionInfo",
      json.nullable(value.ingestion_info, ingestion_info.to_json),
    ),
    #(
      "ingestionType",
      json.nullable(value.ingestion_type, fn(e) {
        json.string(ingestion_type_to_string(e))
      }),
    ),
    #(
      "resolution",
      json.nullable(value.resolution, fn(e) {
        json.string(resolution_to_string(e))
      }),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "30fps" -> decode.success(FrameRateValue30fps)
    "60fps" -> decode.success(FrameRateValue60fps)
    "variable" -> decode.success(FrameRateVariable)
    _ -> decode.failure(FrameRateValue30fps, "a valid FrameRate")
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
  use value <- decode.then(decode.string)
  case value {
    "rtmp" -> decode.success(IngestionTypeRtmp)
    "dash" -> decode.success(IngestionTypeDash)
    "webrtc" -> decode.success(IngestionTypeWebrtc)
    "hls" -> decode.success(IngestionTypeHls)
    _ -> decode.failure(IngestionTypeRtmp, "a valid IngestionType")
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
  use value <- decode.then(decode.string)
  case value {
    "240p" -> decode.success(ResolutionValue240p)
    "360p" -> decode.success(ResolutionValue360p)
    "480p" -> decode.success(ResolutionValue480p)
    "720p" -> decode.success(ResolutionValue720p)
    "1080p" -> decode.success(ResolutionValue1080p)
    "1440p" -> decode.success(ResolutionValue1440p)
    "2160p" -> decode.success(ResolutionValue2160p)
    "variable" -> decode.success(ResolutionVariable)
    _ -> decode.failure(ResolutionValue240p, "a valid Resolution")
  }
}
