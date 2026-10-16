//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Details about paid content, such as paid product placement, sponsorships or endorsement, contained in a YouTube video and a method to inform viewers of paid promotion. This data can only be retrieved by the video owner.
pub type VideoPaidProductPlacementDetails {
  VideoPaidProductPlacementDetails(has_paid_product_placement: Option(Bool))
}

pub fn decoder() -> Decoder(VideoPaidProductPlacementDetails) {
  use has_paid_product_placement <- decode.optional_field(
    "hasPaidProductPlacement",
    option.None,
    decode.optional(decode.bool),
  )
  decode.success(VideoPaidProductPlacementDetails(has_paid_product_placement))
}

pub fn to_json(value: VideoPaidProductPlacementDetails) -> Json {
  json.object([
    #(
      "hasPaidProductPlacement",
      json.nullable(value.has_paid_product_placement, json.bool),
    ),
  ])
}
