//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/access_policy.{type AccessPolicy}
import google_youtube_api_v3/youtube/content_rating.{type ContentRating}
import google_youtube_api_v3/youtube/video_content_details_region_restriction.{
  type VideoContentDetailsRegionRestriction,
}

/// Details about the content of a YouTube Video.
pub type VideoContentDetails {
  VideoContentDetails(
    caption: Option(Caption),
    content_rating: Option(ContentRating),
    country_restriction: Option(AccessPolicy),
    definition: Option(Definition),
    dimension: Option(String),
    duration: Option(String),
    has_custom_thumbnail: Option(Bool),
    licensed_content: Option(Bool),
    projection: Option(Projection),
    region_restriction: Option(VideoContentDetailsRegionRestriction),
  )
}

pub fn decoder() -> Decoder(VideoContentDetails) {
  use caption <- decode.optional_field(
    "caption",
    option.None,
    decode.optional(caption_decoder()),
  )
  use content_rating <- decode.optional_field(
    "contentRating",
    option.None,
    decode.optional(content_rating.decoder()),
  )
  use country_restriction <- decode.optional_field(
    "countryRestriction",
    option.None,
    decode.optional(access_policy.decoder()),
  )
  use definition <- decode.optional_field(
    "definition",
    option.None,
    decode.optional(definition_decoder()),
  )
  use dimension <- decode.optional_field(
    "dimension",
    option.None,
    decode.optional(decode.string),
  )
  use duration <- decode.optional_field(
    "duration",
    option.None,
    decode.optional(decode.string),
  )
  use has_custom_thumbnail <- decode.optional_field(
    "hasCustomThumbnail",
    option.None,
    decode.optional(decode.bool),
  )
  use licensed_content <- decode.optional_field(
    "licensedContent",
    option.None,
    decode.optional(decode.bool),
  )
  use projection <- decode.optional_field(
    "projection",
    option.None,
    decode.optional(projection_decoder()),
  )
  use region_restriction <- decode.optional_field(
    "regionRestriction",
    option.None,
    decode.optional(video_content_details_region_restriction.decoder()),
  )
  decode.success(VideoContentDetails(
    caption,
    content_rating,
    country_restriction,
    definition,
    dimension,
    duration,
    has_custom_thumbnail,
    licensed_content,
    projection,
    region_restriction,
  ))
}

pub fn to_json(value: VideoContentDetails) -> Json {
  json.object([
    #(
      "caption",
      json.nullable(value.caption, fn(e) { json.string(caption_to_string(e)) }),
    ),
    #(
      "contentRating",
      json.nullable(value.content_rating, content_rating.to_json),
    ),
    #(
      "countryRestriction",
      json.nullable(value.country_restriction, access_policy.to_json),
    ),
    #(
      "definition",
      json.nullable(value.definition, fn(e) {
        json.string(definition_to_string(e))
      }),
    ),
    #("dimension", json.nullable(value.dimension, json.string)),
    #("duration", json.nullable(value.duration, json.string)),
    #(
      "hasCustomThumbnail",
      json.nullable(value.has_custom_thumbnail, json.bool),
    ),
    #("licensedContent", json.nullable(value.licensed_content, json.bool)),
    #(
      "projection",
      json.nullable(value.projection, fn(e) {
        json.string(projection_to_string(e))
      }),
    ),
    #(
      "regionRestriction",
      json.nullable(
        value.region_restriction,
        video_content_details_region_restriction.to_json,
      ),
    ),
  ])
}

/// The value of captions indicates whether the video has captions or not.
pub type Caption {
  CaptionTrue
  CaptionFalse
}

pub fn caption_to_string(value: Caption) -> String {
  case value {
    CaptionTrue -> "true"
    CaptionFalse -> "false"
  }
}

pub fn caption_decoder() -> Decoder(Caption) {
  use value <- decode.then(decode.string)
  case value {
    "true" -> decode.success(CaptionTrue)
    "false" -> decode.success(CaptionFalse)
    _ -> decode.failure(CaptionTrue, "a valid Caption")
  }
}

/// The value of definition indicates whether the video is available in high definition or only in standard definition.
pub type Definition {
  DefinitionSd
  DefinitionHd
}

pub fn definition_to_string(value: Definition) -> String {
  case value {
    DefinitionSd -> "sd"
    DefinitionHd -> "hd"
  }
}

pub fn definition_decoder() -> Decoder(Definition) {
  use value <- decode.then(decode.string)
  case value {
    "sd" -> decode.success(DefinitionSd)
    "hd" -> decode.success(DefinitionHd)
    _ -> decode.failure(DefinitionSd, "a valid Definition")
  }
}

/// Specifies the projection format of the video.
pub type Projection {
  ProjectionRectangular
  ProjectionValue360
}

pub fn projection_to_string(value: Projection) -> String {
  case value {
    ProjectionRectangular -> "rectangular"
    ProjectionValue360 -> "360"
  }
}

pub fn projection_decoder() -> Decoder(Projection) {
  use value <- decode.then(decode.string)
  case value {
    "rectangular" -> decode.success(ProjectionRectangular)
    "360" -> decode.success(ProjectionValue360)
    _ -> decode.failure(ProjectionRectangular, "a valid Projection")
  }
}
