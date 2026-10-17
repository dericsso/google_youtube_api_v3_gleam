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

pub fn cuepoint_decoder() -> Decoder(Cuepoint) {
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
  decode.success(
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

pub fn cuepoint_to_json(value: Cuepoint) -> Json {
  json.object(
    [
      #(
        "cueType",
        json.nullable(
          value.cue_type,
          fn(e)
          { json.string(cue_type_to_string(e)) },
        ),
      ),
      #("durationSecs", json.nullable(value.duration_secs, json.int)),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #(
        "insertionOffsetTimeMs",
        json.nullable(value.insertion_offset_time_ms, json.string),
      ),
      #("walltimeMs", json.nullable(value.walltime_ms, json.string)),
    ],
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
  use value <- decode.then(decode.string)
  case value {
    "cueTypeUnspecified" -> decode.success(CueTypeCueTypeUnspecified)
    "cueTypeAd" -> decode.success(CueTypeCueTypeAd)
    _ -> decode.failure(CueTypeCueTypeUnspecified, "a valid CueType")
  }
}

/// Schedule to insert cuepoints into a broadcast by ads automator.
pub type CuepointSchedule {
  CuepointSchedule(
    enabled: Option(Bool),
    pause_ads_until: Option(String),
    repeat_interval_secs: Option(Int),
    schedule_strategy: Option(ScheduleStrategy),
  )
}

pub fn cuepoint_schedule_decoder() -> Decoder(CuepointSchedule) {
  use enabled <- decode.optional_field(
    "enabled",
    option.None,
    decode.optional(decode.bool),
  )
  use pause_ads_until <- decode.optional_field(
    "pauseAdsUntil",
    option.None,
    decode.optional(decode.string),
  )
  use repeat_interval_secs <- decode.optional_field(
    "repeatIntervalSecs",
    option.None,
    decode.optional(decode.int),
  )
  use schedule_strategy <- decode.optional_field(
    "scheduleStrategy",
    option.None,
    decode.optional(schedule_strategy_decoder()),
  )
  decode.success(
    CuepointSchedule(
      enabled,
      pause_ads_until,
      repeat_interval_secs,
      schedule_strategy,
    ),
  )
}

pub fn cuepoint_schedule_to_json(value: CuepointSchedule) -> Json {
  json.object(
    [
      #("enabled", json.nullable(value.enabled, json.bool)),
      #("pauseAdsUntil", json.nullable(value.pause_ads_until, json.string)),
      #(
        "repeatIntervalSecs",
        json.nullable(value.repeat_interval_secs, json.int),
      ),
      #(
        "scheduleStrategy",
        json.nullable(
          value.schedule_strategy,
          fn(e)
          { json.string(schedule_strategy_to_string(e)) },
        ),
      ),
    ],
  )
}

/// The strategy to use when scheduling cuepoints.
pub type ScheduleStrategy {
  ScheduleStrategyScheduleStrategyUnspecified
  ScheduleStrategyConcurrent
  ScheduleStrategyNonConcurrent
}

pub fn schedule_strategy_to_string(value: ScheduleStrategy) -> String {
  case value {
    ScheduleStrategyScheduleStrategyUnspecified -> "scheduleStrategyUnspecified"
    ScheduleStrategyConcurrent -> "concurrent"
    ScheduleStrategyNonConcurrent -> "nonConcurrent"
  }
}

pub fn schedule_strategy_decoder() -> Decoder(ScheduleStrategy) {
  use value <- decode.then(decode.string)
  case value {
    "scheduleStrategyUnspecified" -> decode.success(
      ScheduleStrategyScheduleStrategyUnspecified,
    )
    "concurrent" -> decode.success(ScheduleStrategyConcurrent)
    "nonConcurrent" -> decode.success(ScheduleStrategyNonConcurrent)
    _ -> decode.failure(
      ScheduleStrategyScheduleStrategyUnspecified,
      "a valid ScheduleStrategy",
    )
  }
}