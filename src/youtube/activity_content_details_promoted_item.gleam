//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, list, success, then, failure}
import gleam/option

/// Details about a resource which is being promoted.
pub type ActivityContentDetailsPromotedItem {
  ActivityContentDetailsPromotedItem(
    ad_tag: option.Option(String),
    click_tracking_url: option.Option(String),
    creative_view_url: option.Option(String),
    cta_type: option.Option(CtaType),
    custom_cta_button_text: option.Option(String),
    description_text: option.Option(String),
    destination_url: option.Option(String),
    forecasting_url: option.Option(List(String)),
    impression_url: option.Option(List(String)),
    video_id: option.Option(String),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsPromotedItem) {
  use ad_tag <- optional_field("adTag", option.None, optional(string))
  use click_tracking_url <- optional_field(
    "clickTrackingUrl",
    option.None,
    optional(string),
  )
  use creative_view_url <- optional_field(
    "creativeViewUrl",
    option.None,
    optional(string),
  )
  use cta_type <- optional_field(
    "ctaType",
    option.None,
    optional(cta_type_decoder()),
  )
  use custom_cta_button_text <- optional_field(
    "customCtaButtonText",
    option.None,
    optional(string),
  )
  use description_text <- optional_field(
    "descriptionText",
    option.None,
    optional(string),
  )
  use destination_url <- optional_field(
    "destinationUrl",
    option.None,
    optional(string),
  )
  use forecasting_url <- optional_field(
    "forecastingUrl",
    option.None,
    optional(list(string)),
  )
  use impression_url <- optional_field(
    "impressionUrl",
    option.None,
    optional(list(string)),
  )
  use video_id <- optional_field("videoId", option.None, optional(string))
  success(
    ActivityContentDetailsPromotedItem(
      ad_tag,
      click_tracking_url,
      creative_view_url,
      cta_type,
      custom_cta_button_text,
      description_text,
      destination_url,
      forecasting_url,
      impression_url,
      video_id,
    ),
  )
}

/// The type of call-to-action, a message to the user indicating action that can be taken.
pub type CtaType {
  CtaTypeCtaTypeUnspecified
  CtaTypeVisitAdvertiserSite
}

pub fn cta_type_to_string(value: CtaType) -> String {
  case value {
    CtaTypeCtaTypeUnspecified -> "ctaTypeUnspecified"
    CtaTypeVisitAdvertiserSite -> "visitAdvertiserSite"
  }
}

pub fn cta_type_decoder() -> Decoder(CtaType) {
  use value <- then(string)
  case value {
    "ctaTypeUnspecified" -> success(CtaTypeCtaTypeUnspecified)
    "visitAdvertiserSite" -> success(CtaTypeVisitAdvertiserSite)
    _ -> failure(CtaTypeCtaTypeUnspecified, "a valid CtaType")
  }
}