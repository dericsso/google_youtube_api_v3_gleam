//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Note that there may be a 5-second end-point resolution issue. For instance, if a cuepoint comes in for 22:03:27, we may stuff the cuepoint into 22:03:25 or 22:03:30, depending. This is an artifact of HLS.
pub type Cuepoint {
  Cuepoint(
    cue_type: option.Option(String),
    duration_secs: option.Option(Int),
    etag: option.Option(String),
    id: option.Option(String),
    insertion_offset_time_ms: option.Option(String),
    walltime_ms: option.Option(String),
  )
}
