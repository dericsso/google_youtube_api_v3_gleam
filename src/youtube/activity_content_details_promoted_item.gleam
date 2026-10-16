//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Details about a resource which is being promoted.
pub type ActivityContentDetailsPromotedItem {
  ActivityContentDetailsPromotedItem(
    ad_tag: option.Option(String),
    click_tracking_url: option.Option(String),
    creative_view_url: option.Option(String),
    cta_type: option.Option(String),
    custom_cta_button_text: option.Option(String),
    description_text: option.Option(String),
    destination_url: option.Option(String),
    forecasting_url: option.Option(List(String)),
    impression_url: option.Option(List(String)),
    video_id: option.Option(String),
  )
}
