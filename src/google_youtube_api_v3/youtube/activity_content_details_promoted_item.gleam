//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about a resource which is being promoted.
pub type ActivityContentDetailsPromotedItem {
  ActivityContentDetailsPromotedItem(
    ad_tag: Option(String),
    click_tracking_url: Option(String),
    creative_view_url: Option(String),
    cta_type: Option(CtaType),
    custom_cta_button_text: Option(String),
    description_text: Option(String),
    destination_url: Option(String),
    forecasting_url: Option(List(String)),
    impression_url: Option(List(String)),
    video_id: Option(String),
  )
}

pub fn decoder() -> Decoder(ActivityContentDetailsPromotedItem) {
  use ad_tag <- decode.optional_field(
    "adTag",
    option.None,
    decode.optional(decode.string),
  )
  use click_tracking_url <- decode.optional_field(
    "clickTrackingUrl",
    option.None,
    decode.optional(decode.string),
  )
  use creative_view_url <- decode.optional_field(
    "creativeViewUrl",
    option.None,
    decode.optional(decode.string),
  )
  use cta_type <- decode.optional_field(
    "ctaType",
    option.None,
    decode.optional(cta_type_decoder()),
  )
  use custom_cta_button_text <- decode.optional_field(
    "customCtaButtonText",
    option.None,
    decode.optional(decode.string),
  )
  use description_text <- decode.optional_field(
    "descriptionText",
    option.None,
    decode.optional(decode.string),
  )
  use destination_url <- decode.optional_field(
    "destinationUrl",
    option.None,
    decode.optional(decode.string),
  )
  use forecasting_url <- decode.optional_field(
    "forecastingUrl",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use impression_url <- decode.optional_field(
    "impressionUrl",
    option.None,
    decode.optional(decode.list(decode.string)),
  )
  use video_id <- decode.optional_field(
    "videoId",
    option.None,
    decode.optional(decode.string),
  )
  decode.success(ActivityContentDetailsPromotedItem(
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
  ))
}

pub fn to_json(value: ActivityContentDetailsPromotedItem) -> Json {
  json.object([
    #("adTag", json.nullable(value.ad_tag, json.string)),
    #("clickTrackingUrl", json.nullable(value.click_tracking_url, json.string)),
    #("creativeViewUrl", json.nullable(value.creative_view_url, json.string)),
    #(
      "ctaType",
      json.nullable(value.cta_type, fn(e) { json.string(cta_type_to_string(e)) }),
    ),
    #(
      "customCtaButtonText",
      json.nullable(value.custom_cta_button_text, json.string),
    ),
    #("descriptionText", json.nullable(value.description_text, json.string)),
    #("destinationUrl", json.nullable(value.destination_url, json.string)),
    #(
      "forecastingUrl",
      json.nullable(value.forecasting_url, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #(
      "impressionUrl",
      json.nullable(value.impression_url, fn(items) {
        json.array(items, json.string)
      }),
    ),
    #("videoId", json.nullable(value.video_id, json.string)),
  ])
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
  use value <- decode.then(decode.string)
  case value {
    "ctaTypeUnspecified" -> decode.success(CtaTypeCtaTypeUnspecified)
    "visitAdvertiserSite" -> decode.success(CtaTypeVisitAdvertiserSite)
    _ -> decode.failure(CtaTypeCtaTypeUnspecified, "a valid CtaType")
  }
}
