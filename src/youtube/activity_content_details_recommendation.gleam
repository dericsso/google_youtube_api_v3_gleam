//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/resource_id.{type ResourceId}

/// Information that identifies the recommended resource.
pub type ActivityContentDetailsRecommendation {
  ActivityContentDetailsRecommendation(
    reason: Option(Reason),
    resource_id: Option(ResourceId),
    seed_resource_id: Option(ResourceId),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsRecommendation) {
  use reason <- decode.optional_field(
    "reason",
    option.None,
    decode.optional(reason_decoder()),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  use seed_resource_id <- decode.optional_field(
    "seedResourceId",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  decode.success(ActivityContentDetailsRecommendation(
    reason,
    resource_id,
    seed_resource_id,
  ))
}

pub fn to_json(value: ActivityContentDetailsRecommendation) -> Json {
  json.object([
    #(
      "reason",
      json.nullable(value.reason, fn(e) { json.string(reason_to_string(e)) }),
    ),
    #("resourceId", json.nullable(value.resource_id, resource_id.to_json)),
    #(
      "seedResourceId",
      json.nullable(value.seed_resource_id, resource_id.to_json),
    ),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "reasonUnspecified" -> decode.success(ReasonReasonUnspecified)
    "videoWatched" -> decode.success(ReasonVideoWatched)
    _ -> decode.failure(ReasonReasonUnspecified, "a valid Reason")
  }
}
