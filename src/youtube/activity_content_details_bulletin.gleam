//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/resource_id.{type ResourceId}

/// Details about a channel bulletin post.
pub type ActivityContentDetailsBulletin {
  ActivityContentDetailsBulletin(resource_id: Option(ResourceId))
}

pub fn decoder() -> Decoder(ActivityContentDetailsBulletin) {
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  decode.success(ActivityContentDetailsBulletin(resource_id))
}

pub fn to_json(value: ActivityContentDetailsBulletin) -> Json {
  json.object([
    #("resourceId", json.nullable(value.resource_id, resource_id.to_json)),
  ])
}
