//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, int, success, then, failure}
import gleam/option

/// Details about the content to witch a subscription refers.
pub type SubscriptionContentDetails {
  SubscriptionContentDetails(
    activity_type: option.Option(ActivityType),
    new_item_count: option.Option(Int),
    total_item_count: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(SubscriptionContentDetails) {
  use activity_type <- optional_field(
    "activityType",
    option.None,
    optional(activity_type_decoder()),
  )
  use new_item_count <- optional_field(
    "newItemCount",
    option.None,
    optional(int),
  )
  use total_item_count <- optional_field(
    "totalItemCount",
    option.None,
    optional(int),
  )
  success(
    SubscriptionContentDetails(activity_type, new_item_count, total_item_count),
  )
}

/// The type of activity this subscription is for (only uploads, everything).
pub type ActivityType {
  ActivityTypeSubscriptionActivityTypeUnspecified
  ActivityTypeAll
  ActivityTypeUploads
}

pub fn activity_type_to_string(value: ActivityType) -> String {
  case value {
    ActivityTypeSubscriptionActivityTypeUnspecified -> "subscriptionActivityTypeUnspecified"
    ActivityTypeAll -> "all"
    ActivityTypeUploads -> "uploads"
  }
}

pub fn activity_type_decoder() -> Decoder(ActivityType) {
  use value <- then(string)
  case value {
    "subscriptionActivityTypeUnspecified" -> success(
      ActivityTypeSubscriptionActivityTypeUnspecified,
    )
    "all" -> success(ActivityTypeAll)
    "uploads" -> success(ActivityTypeUploads)
    _ -> failure(
      ActivityTypeSubscriptionActivityTypeUnspecified,
      "a valid ActivityType",
    )
  }
}