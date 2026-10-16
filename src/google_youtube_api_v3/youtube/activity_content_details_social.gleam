//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/resource_id.{type ResourceId}

/// Details about a social network post.
pub type ActivityContentDetailsSocial {
  ActivityContentDetailsSocial(
    author: Option(String),
    image_url: Option(String),
    reference_url: Option(String),
    resource_id: Option(ResourceId),
    type_: Option(Type),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsSocial) {
  use author <- decode.optional_field(
    "author",
    option.None,
    decode.optional(decode.string),
  )
  use image_url <- decode.optional_field(
    "imageUrl",
    option.None,
    decode.optional(decode.string),
  )
  use reference_url <- decode.optional_field(
    "referenceUrl",
    option.None,
    decode.optional(decode.string),
  )
  use resource_id <- decode.optional_field(
    "resourceId",
    option.None,
    decode.optional(resource_id.decoder()),
  )
  use type_ <- decode.optional_field(
    "type",
    option.None,
    decode.optional(type_decoder()),
  )
  decode.success(ActivityContentDetailsSocial(
    author,
    image_url,
    reference_url,
    resource_id,
    type_,
  ))
}

pub fn to_json(value: ActivityContentDetailsSocial) -> Json {
  json.object([
    #("author", json.nullable(value.author, json.string)),
    #("imageUrl", json.nullable(value.image_url, json.string)),
    #("referenceUrl", json.nullable(value.reference_url, json.string)),
    #("resourceId", json.nullable(value.resource_id, resource_id.to_json)),
    #(
      "type",
      json.nullable(value.type_, fn(e) { json.string(type_to_string(e)) }),
    ),
  ])
}

/// The name of the social network.
pub type Type {
  TypeUnspecified
  TypeGooglePlus
  TypeFacebook
  TypeTwitter
}

pub fn type_to_string(value: Type) -> String {
  case value {
    TypeUnspecified -> "unspecified"
    TypeGooglePlus -> "googlePlus"
    TypeFacebook -> "facebook"
    TypeTwitter -> "twitter"
  }
}

pub fn type_decoder() -> Decoder(Type) {
  use value <- decode.then(decode.string)
  case value {
    "unspecified" -> decode.success(TypeUnspecified)
    "googlePlus" -> decode.success(TypeGooglePlus)
    "facebook" -> decode.success(TypeFacebook)
    "twitter" -> decode.success(TypeTwitter)
    _ -> decode.failure(TypeUnspecified, "a valid Type")
  }
}
