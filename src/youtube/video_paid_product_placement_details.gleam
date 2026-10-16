//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Details about paid content, such as paid product placement, sponsorships or endorsement, contained in a YouTube video and a method to inform viewers of paid promotion. This data can only be retrieved by the video owner.
pub type VideoPaidProductPlacementDetails {
  VideoPaidProductPlacementDetails(
    has_paid_product_placement: option.Option(Bool),
  )
}
