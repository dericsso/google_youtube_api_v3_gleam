//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Note that there may be a 5-second end-point resolution issue. For instance, if a cuepoint comes in for 22:03:27, we may stuff the cuepoint into 22:03:25 or 22:03:30, depending. This is an artifact of HLS.
pub type Cuepoint {
  Cuepoint(
    cue_type: Option(CueType),
    duration_secs: Option(Int),
    etag: Option(String),
    id: Option(String),
    insertion_offset_time_ms: Option(String),
    walltime_ms: Option(String),
  )
}

pub fn decoder() -> Decoder(Cuepoint) {
  use cue_type <- decode.optional_field(
    "cueType",
    option.None,
    decode.optional(cue_type_decoder()),
  )
  use duration_secs <- decode.optional_field(
    "durationSecs",
    option.None,
    decode.optional(decode.int),
  )
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use insertion_offset_time_ms <- decode.optional_field(
    "insertionOffsetTimeMs",
    option.None,
    decode.optional(decode.string),
  )
  use walltime_ms <- decode.optional_field(
    "walltimeMs",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(Cuepoint(
    cue_type,
    duration_secs,
    etag,
    id,
    insertion_offset_time_ms,
    walltime_ms,
  ))
}

pub fn to_json(value: Cuepoint) -> Json {
  json.object([
    #(
      "cueType",
      json.nullable(value.cue_type, fn(e) { json.string(cue_type_to_string(e)) }),
    ),
    #("durationSecs", json.nullable(value.duration_secs, json.int)),
    #("etag", json.nullable(value.etag, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #(
      "insertionOffsetTimeMs",
      json.nullable(value.insertion_offset_time_ms, json.string),
    ),
    #("walltimeMs", json.nullable(value.walltime_ms, json.string)),
  ])
}

pub type CueType {
  CueTypeCueTypeUnspecified
  CueTypeCueTypeAd
}

pub fn cue_type_to_string(value: CueType) -> String {
  case value {
    CueTypeCueTypeUnspecified -> "cueTypeUnspecified"
    CueTypeCueTypeAd -> "cueTypeAd"
  }
}

pub fn cue_type_decoder() -> Decoder(CueType) {
  use value <- decode.then(decode.string)
  case value {
    "cueTypeUnspecified" -> decode.success(CueTypeCueTypeUnspecified)
    "cueTypeAd" -> decode.success(CueTypeCueTypeAd)
    _ -> decode.failure(CueTypeCueTypeUnspecified, "a valid CueType")
  }
}
