//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about the content to witch a subscription refers.
pub type SubscriptionContentDetails {
  SubscriptionContentDetails(
    activity_type: Option(ActivityType),
    new_item_count: Option(Int),
    total_item_count: Option(Int),
  )
}

pub fn decoder() -> Decoder(SubscriptionContentDetails) {
  use activity_type <- decode.optional_field(
    "activityType",
    option.None,
    decode.optional(activity_type_decoder()),
  )
  use new_item_count <- decode.optional_field(
    "newItemCount",
    option.None,
    decode.optional(decode.int),
  )
  use total_item_count <- decode.optional_field(
    "totalItemCount",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(SubscriptionContentDetails(
    activity_type,
    new_item_count,
    total_item_count,
  ))
}

pub fn to_json(value: SubscriptionContentDetails) -> Json {
  json.object([
    #(
      "activityType",
      json.nullable(value.activity_type, fn(e) {
        json.string(activity_type_to_string(e))
      }),
    ),
    #("newItemCount", json.nullable(value.new_item_count, json.int)),
    #("totalItemCount", json.nullable(value.total_item_count, json.int)),
  ])
}

/// The type of activity this subscription is for (only uploads, everything).
pub type ActivityType {
  ActivityTypeSubscriptionActivityTypeUnspecified
  ActivityTypeAll
  ActivityTypeUploads
}

pub fn activity_type_to_string(value: ActivityType) -> String {
  case value {
    ActivityTypeSubscriptionActivityTypeUnspecified ->
      "subscriptionActivityTypeUnspecified"
    ActivityTypeAll -> "all"
    ActivityTypeUploads -> "uploads"
  }
}

pub fn activity_type_decoder() -> Decoder(ActivityType) {
  use value <- decode.then(decode.string)
  case value {
    "subscriptionActivityTypeUnspecified" ->
      decode.success(ActivityTypeSubscriptionActivityTypeUnspecified)
    "all" -> decode.success(ActivityTypeAll)
    "uploads" -> decode.success(ActivityTypeUploads)
    _ ->
      decode.failure(
        ActivityTypeSubscriptionActivityTypeUnspecified,
        "a valid ActivityType",
      )
  }
}
