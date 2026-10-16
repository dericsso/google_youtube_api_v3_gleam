//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option

/// Live broadcast state.
pub type LiveBroadcastStatus {
  LiveBroadcastStatus(
    life_cycle_status: option.Option(LifeCycleStatus),
    live_broadcast_priority: option.Option(LiveBroadcastPriority),
    made_for_kids: option.Option(Bool),
    privacy_status: option.Option(PrivacyStatus),
    recording_status: option.Option(RecordingStatus),
    self_declared_made_for_kids: option.Option(Bool),
  )
}

pub fn decoder() -> Decoder(LiveBroadcastStatus) {
  use life_cycle_status <- optional_field(
    "lifeCycleStatus",
    option.None,
    optional(life_cycle_status_decoder()),
  )
  use live_broadcast_priority <- optional_field(
    "liveBroadcastPriority",
    option.None,
    optional(live_broadcast_priority_decoder()),
  )
  use made_for_kids <- optional_field(
    "madeForKids",
    option.None,
    optional(bool),
  )
  use privacy_status <- optional_field(
    "privacyStatus",
    option.None,
    optional(privacy_status_decoder()),
  )
  use recording_status <- optional_field(
    "recordingStatus",
    option.None,
    optional(recording_status_decoder()),
  )
  use self_declared_made_for_kids <- optional_field(
    "selfDeclaredMadeForKids",
    option.None,
    optional(bool),
  )
  success(
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
  use value <- then(string)
  case value {
    "lifeCycleStatusUnspecified" -> success(
      LifeCycleStatusLifeCycleStatusUnspecified,
    )
    "created" -> success(LifeCycleStatusCreated)
    "ready" -> success(LifeCycleStatusReady)
    "testing" -> success(LifeCycleStatusTesting)
    "live" -> success(LifeCycleStatusLive)
    "complete" -> success(LifeCycleStatusComplete)
    "revoked" -> success(LifeCycleStatusRevoked)
    "testStarting" -> success(LifeCycleStatusTestStarting)
    "liveStarting" -> success(LifeCycleStatusLiveStarting)
    _ -> failure(
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
  use value <- then(string)
  case value {
    "liveBroadcastPriorityUnspecified" -> success(
      LiveBroadcastPriorityLiveBroadcastPriorityUnspecified,
    )
    "low" -> success(LiveBroadcastPriorityLow)
    "normal" -> success(LiveBroadcastPriorityNormal)
    "high" -> success(LiveBroadcastPriorityHigh)
    _ -> failure(
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
  use value <- then(string)
  case value {
    "public" -> success(PrivacyStatusPublic)
    "unlisted" -> success(PrivacyStatusUnlisted)
    "private" -> success(PrivacyStatusPrivate)
    _ -> failure(PrivacyStatusPublic, "a valid PrivacyStatus")
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
  use value <- then(string)
  case value {
    "liveBroadcastRecordingStatusUnspecified" -> success(
      RecordingStatusLiveBroadcastRecordingStatusUnspecified,
    )
    "notRecording" -> success(RecordingStatusNotRecording)
    "recording" -> success(RecordingStatusRecording)
    "recorded" -> success(RecordingStatusRecorded)
    _ -> failure(
      RecordingStatusLiveBroadcastRecordingStatusUnspecified,
      "a valid RecordingStatus",
    )
  }
}