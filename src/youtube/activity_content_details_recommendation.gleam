//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/resource_id.{type ResourceId}

/// Information that identifies the recommended resource.
pub type ActivityContentDetailsRecommendation {
  ActivityContentDetailsRecommendation(
    reason: option.Option(Reason),
    resource_id: option.Option(ResourceId),
    seed_resource_id: option.Option(ResourceId),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsRecommendation) {
  use reason <- optional_field(
    "reason",
    option.None,
    optional(reason_decoder()),
  )
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  use seed_resource_id <- optional_field(
    "seedResourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  success(
    ActivityContentDetailsRecommendation(reason, resource_id, seed_resource_id),
  )
}

/// The reason that the resource is recommended to the user.
pub type Reason {
  ReasonReasonUnspecified
  ReasonVideoWatched
}

pub fn reason_to_string(value: Reason) -> String {
  case value {
    ReasonReasonUnspecified -> "reasonUnspecified"
    ReasonVideoWatched -> "videoWatched"
  }
}

pub fn reason_decoder() -> Decoder(Reason) {
  use value <- then(string)
  case value {
    "reasonUnspecified" -> success(ReasonReasonUnspecified)
    "videoWatched" -> success(ReasonVideoWatched)
    _ -> failure(ReasonReasonUnspecified, "a valid Reason")
  }
}