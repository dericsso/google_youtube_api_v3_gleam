//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success, then, failure}
import gleam/option

/// Note that there may be a 5-second end-point resolution issue. For instance, if a cuepoint comes in for 22:03:27, we may stuff the cuepoint into 22:03:25 or 22:03:30, depending. This is an artifact of HLS.
pub type Cuepoint {
  Cuepoint(
    cue_type: option.Option(CueType),
    duration_secs: option.Option(Int),
    etag: option.Option(String),
    id: option.Option(String),
    insertion_offset_time_ms: option.Option(String),
    walltime_ms: option.Option(String),
  )
}

pub fn decoder() -> Decoder(Cuepoint) {
  use cue_type <- optional_field(
    "cueType",
    option.None,
    optional(cue_type_decoder()),
  )
  use duration_secs <- optional_field(
    "durationSecs",
    option.None,
    optional(int),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use insertion_offset_time_ms <- optional_field(
    "insertionOffsetTimeMs",
    option.None,
    optional(string),
  )
  use walltime_ms <- optional_field("walltimeMs", option.None, optional(string))
  success(
    Cuepoint(
      cue_type,
      duration_secs,
      etag,
      id,
      insertion_offset_time_ms,
      walltime_ms,
    ),
  )
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
  use value <- then(string)
  case value {
    "cueTypeUnspecified" -> success(CueTypeCueTypeUnspecified)
    "cueTypeAd" -> success(CueTypeCueTypeAd)
    _ -> failure(CueTypeCueTypeUnspecified, "a valid CueType")
  }
}