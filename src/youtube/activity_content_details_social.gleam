//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success, then, failure}
import gleam/option
import youtube/resource_id.{type ResourceId}

/// Details about a social network post.
pub type ActivityContentDetailsSocial {
  ActivityContentDetailsSocial(
    author: option.Option(String),
    image_url: option.Option(String),
    reference_url: option.Option(String),
    resource_id: option.Option(ResourceId),
    type_: option.Option(Type),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsSocial) {
  use author <- optional_field("author", option.None, optional(string))
  use image_url <- optional_field("imageUrl", option.None, optional(string))
  use reference_url <- optional_field(
    "referenceUrl",
    option.None,
    optional(string),
  )
  use resource_id <- optional_field(
    "resourceId",
    option.None,
    optional(resource_id.decoder()),
  )
  use type_ <- optional_field("type", option.None, optional(type_decoder()))
  success(
    ActivityContentDetailsSocial(
      author,
      image_url,
      reference_url,
      resource_id,
      type_,
    ),
  )
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
  use value <- then(string)
  case value {
    "unspecified" -> success(TypeUnspecified)
    "googlePlus" -> success(TypeGooglePlus)
    "facebook" -> success(TypeFacebook)
    "twitter" -> success(TypeTwitter)
    _ -> failure(TypeUnspecified, "a valid Type")
  }
}