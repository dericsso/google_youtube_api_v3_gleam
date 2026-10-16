//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, bool, success}
import gleam/option

/// Details about paid content, such as paid product placement, sponsorships or endorsement, contained in a YouTube video and a method to inform viewers of paid promotion. This data can only be retrieved by the video owner.
pub type VideoPaidProductPlacementDetails {
  VideoPaidProductPlacementDetails(
    has_paid_product_placement: option.Option(Bool),
  )
}

pub fn decoder() -> Decoder(VideoPaidProductPlacementDetails) {
  use has_paid_product_placement <- optional_field(
    "hasPaidProductPlacement",
    option.None,
    optional(bool),
  )
  success(VideoPaidProductPlacementDetails(has_paid_product_placement))
}