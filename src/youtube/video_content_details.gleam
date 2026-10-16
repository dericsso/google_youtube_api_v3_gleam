//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success, then, failure}
import gleam/option
import youtube/access_policy.{type AccessPolicy}
import youtube/content_rating.{type ContentRating}
import youtube/video_content_details_region_restriction.{type VideoContentDetailsRegionRestriction}

/// Details about the content of a YouTube Video.
pub type VideoContentDetails {
  VideoContentDetails(
    caption: option.Option(Caption),
    content_rating: option.Option(ContentRating),
    country_restriction: option.Option(AccessPolicy),
    definition: option.Option(Definition),
    dimension: option.Option(String),
    duration: option.Option(String),
    has_custom_thumbnail: option.Option(Bool),
    licensed_content: option.Option(Bool),
    projection: option.Option(Projection),
    region_restriction: option.Option(VideoContentDetailsRegionRestriction),
  )
}

pub fn decoder() -> Decoder(VideoContentDetails) {
  use caption <- optional_field(
    "caption",
    option.None,
    optional(caption_decoder()),
  )
  use content_rating <- optional_field(
    "contentRating",
    option.None,
    optional(content_rating.decoder()),
  )
  use country_restriction <- optional_field(
    "countryRestriction",
    option.None,
    optional(access_policy.decoder()),
  )
  use definition <- optional_field(
    "definition",
    option.None,
    optional(definition_decoder()),
  )
  use dimension <- optional_field("dimension", option.None, optional(string))
  use duration <- optional_field("duration", option.None, optional(string))
  use has_custom_thumbnail <- optional_field(
    "hasCustomThumbnail",
    option.None,
    optional(bool),
  )
  use licensed_content <- optional_field(
    "licensedContent",
    option.None,
    optional(bool),
  )
  use projection <- optional_field(
    "projection",
    option.None,
    optional(projection_decoder()),
  )
  use region_restriction <- optional_field(
    "regionRestriction",
    option.None,
    optional(video_content_details_region_restriction.decoder()),
  )
  success(
    VideoContentDetails(
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
    ),
  )
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
  use value <- then(string)
  case value {
    "true" -> success(CaptionTrue)
    "false" -> success(CaptionFalse)
    _ -> failure(CaptionTrue, "a valid Caption")
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
  use value <- then(string)
  case value {
    "sd" -> success(DefinitionSd)
    "hd" -> success(DefinitionHd)
    _ -> failure(DefinitionSd, "a valid Definition")
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
  use value <- then(string)
  case value {
    "rectangular" -> success(ProjectionRectangular)
    "360" -> success(ProjectionValue360)
    _ -> failure(ProjectionRectangular, "a valid Projection")
  }
}