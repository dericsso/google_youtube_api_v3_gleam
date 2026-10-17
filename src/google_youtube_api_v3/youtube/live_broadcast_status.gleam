//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Live broadcast state.
pub type LiveBroadcastStatus {
  LiveBroadcastStatus(
    life_cycle_status: Option(LifeCycleStatus),
    live_broadcast_priority: Option(LiveBroadcastPriority),
    made_for_kids: Option(Bool),
    privacy_status: Option(PrivacyStatus),
    recording_status: Option(RecordingStatus),
    self_declared_made_for_kids: Option(Bool),
  )
}

pub fn decoder() -> Decoder(LiveBroadcastStatus) {
  use life_cycle_status <- decode.optional_field(
    "lifeCycleStatus",
    option.None,
    decode.optional(life_cycle_status_decoder()),
  )
  use live_broadcast_priority <- decode.optional_field(
    "liveBroadcastPriority",
    option.None,
    decode.optional(live_broadcast_priority_decoder()),
  )
  use made_for_kids <- decode.optional_field(
    "madeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  use privacy_status <- decode.optional_field(
    "privacyStatus",
    option.None,
    decode.optional(privacy_status_decoder()),
  )
  use recording_status <- decode.optional_field(
    "recordingStatus",
    option.None,
    decode.optional(recording_status_decoder()),
  )
  use self_declared_made_for_kids <- decode.optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(
    LiveBroadcastStatus(
      life_cycle_status,
      live_broadcast_priority,
      made_for_kids,
      privacy_status,
      recording_status,
      self_declared_made_for_kids,
    ),
  )
}

pub fn to_json(value: LiveBroadcastStatus) -> Json {
  json.object(
    [
      #(
        "lifeCycleStatus",
        json.nullable(
          value.life_cycle_status,
          fn(e)
          { json.string(life_cycle_status_to_string(e)) },
        ),
      ),
      #(
        "liveBroadcastPriority",
        json.nullable(
          value.live_broadcast_priority,
          fn(e)
          { json.string(live_broadcast_priority_to_string(e)) },
        ),
      ),
      #("madeForKids", json.nullable(value.made_for_kids, json.bool)),
      #(
        "privacyStatus",
        json.nullable(
          value.privacy_status,
          fn(e)
          { json.string(privacy_status_to_string(e)) },
        ),
      ),
      #(
        "recordingStatus",
        json.nullable(
          value.recording_status,
          fn(e)
          { json.string(recording_status_to_string(e)) },
        ),
      ),
      #(
        "selfDeclaredMadeForKids",
        json.nullable(value.self_declared_made_for_kids, json.bool),
      ),
    ],
  )
}

/// The broadcast's status. The status can be updated using the API's liveBroadcasts.transition method.
pub type LifeCycleStatus {
  LifeCycleStatusLifeCycleStatusUnspecified
  LifeCycleStatusCreated
  LifeCycleStatusReady
  LifeCycleStatusTesting
  LifeCycleStatusLive
  LifeCycleStatusComplete
  LifeCycleStatusRevoked
  LifeCycleStatusTestStarting
  LifeCycleStatusLiveStarting
}

pub fn life_cycle_status_to_string(value: LifeCycleStatus) -> String {
  case value {
    LifeCycleStatusLifeCycleStatusUnspecified -> "lifeCycleStatusUnspecified"
    LifeCycleStatusCreated -> "created"
    LifeCycleStatusReady -> "ready"
    LifeCycleStatusTesting -> "testing"
    LifeCycleStatusLive -> "live"
    LifeCycleStatusComplete -> "complete"
    LifeCycleStatusRevoked -> "revoked"
    LifeCycleStatusTestStarting -> "testStarting"
    LifeCycleStatusLiveStarting -> "liveStarting"
  }
}

pub fn life_cycle_status_decoder() -> Decoder(LifeCycleStatus) {
  use value <- decode.then(decode.string)
  case value {
    "lifeCycleStatusUnspecified" -> decode.success(
      LifeCycleStatusLifeCycleStatusUnspecified,
    )
    "created" -> decode.success(LifeCycleStatusCreated)
    "ready" -> decode.success(LifeCycleStatusReady)
    "testing" -> decode.success(LifeCycleStatusTesting)
    "live" -> decode.success(LifeCycleStatusLive)
    "complete" -> decode.success(LifeCycleStatusComplete)
    "revoked" -> decode.success(LifeCycleStatusRevoked)
    "testStarting" -> decode.success(LifeCycleStatusTestStarting)
    "liveStarting" -> decode.success(LifeCycleStatusLiveStarting)
    _ -> decode.failure(
      LifeCycleStatusLifeCycleStatusUnspecified,
      "a valid LifeCycleStatus",
    )
  }
}

/// Priority of the live broadcast event (internal state).
pub type LiveBroadcastPriority {
  LiveBroadcastPriorityLiveBroadcastPriorityUnspecified
  LiveBroadcastPriorityLow
  LiveBroadcastPriorityNormal
  LiveBroadcastPriorityHigh
}

pub fn live_broadcast_priority_to_string(value: LiveBroadcastPriority) -> String {
  case value
  {
    LiveBroadcastPriorityLiveBroadcastPriorityUnspecified -> "liveBroadcastPriorityUnspecified"
    LiveBroadcastPriorityLow -> "low"
    LiveBroadcastPriorityNormal -> "normal"
    LiveBroadcastPriorityHigh -> "high"
  }
}

pub fn live_broadcast_priority_decoder() -> Decoder(LiveBroadcastPriority) {
  use value <- decode.then(decode.string)
  case value {
    "liveBroadcastPriorityUnspecified" -> decode.success(
      LiveBroadcastPriorityLiveBroadcastPriorityUnspecified,
    )
    "low" -> decode.success(LiveBroadcastPriorityLow)
    "normal" -> decode.success(LiveBroadcastPriorityNormal)
    "high" -> decode.success(LiveBroadcastPriorityHigh)
    _ -> decode.failure(
      LiveBroadcastPriorityLiveBroadcastPriorityUnspecified,
      "a valid LiveBroadcastPriority",
    )
  }
}

/// The broadcast's privacy status. Note that the broadcast represents exactly one YouTube video, so the privacy settings are identical to those supported for videos. In addition, you can set this field by modifying the broadcast resource or by setting the privacyStatus field of the corresponding video resource.
pub type PrivacyStatus {
  PrivacyStatusPublic
  PrivacyStatusUnlisted
  PrivacyStatusPrivate
}

pub fn privacy_status_to_string(value: PrivacyStatus) -> String {
  case value {
    PrivacyStatusPublic -> "public"
    PrivacyStatusUnlisted -> "unlisted"
    PrivacyStatusPrivate -> "private"
  }
}

pub fn privacy_status_decoder() -> Decoder(PrivacyStatus) {
  use value <- decode.then(decode.string)
  case value {
    "public" -> decode.success(PrivacyStatusPublic)
    "unlisted" -> decode.success(PrivacyStatusUnlisted)
    "private" -> decode.success(PrivacyStatusPrivate)
    _ -> decode.failure(PrivacyStatusPublic, "a valid PrivacyStatus")
  }
}

/// The broadcast's recording status.
pub type RecordingStatus {
  RecordingStatusLiveBroadcastRecordingStatusUnspecified
  RecordingStatusNotRecording
  RecordingStatusRecording
  RecordingStatusRecorded
}

pub fn recording_status_to_string(value: RecordingStatus) -> String {
  case value {
    RecordingStatusLiveBroadcastRecordingStatusUnspecified -> "liveBroadcastRecordingStatusUnspecified"
    RecordingStatusNotRecording -> "notRecording"
    RecordingStatusRecording -> "recording"
    RecordingStatusRecorded -> "recorded"
  }
}

pub fn recording_status_decoder() -> Decoder(RecordingStatus) {
  use value <- decode.then(decode.string)
  case value {
    "liveBroadcastRecordingStatusUnspecified" -> decode.success(
      RecordingStatusLiveBroadcastRecordingStatusUnspecified,
    )
    "notRecording" -> decode.success(RecordingStatusNotRecording)
    "recording" -> decode.success(RecordingStatusRecording)
    "recorded" -> decode.success(RecordingStatusRecorded)
    _ -> decode.failure(
      RecordingStatusLiveBroadcastRecordingStatusUnspecified,
      "a valid RecordingStatus",
    )
  }
}