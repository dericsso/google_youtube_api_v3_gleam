//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Details about the content to witch a subscription refers.
pub type SubscriptionContentDetails {
  SubscriptionContentDetails(
    activity_type: option.Option(String),
    new_item_count: option.Option(Int),
    total_item_count: option.Option(Int),
  )
}
