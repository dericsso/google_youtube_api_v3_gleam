//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option

/// Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
pub type PageInfo {
  PageInfo(
    results_per_page: option.Option(Int),
    total_results: option.Option(Int),
  )
}
