//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, int, success}
import gleam/option

/// Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
pub type PageInfo {
  PageInfo(
    results_per_page: option.Option(Int),
    total_results: option.Option(Int),
  )
}

pub fn decoder() -> Decoder(PageInfo) {
  use results_per_page <- optional_field(
    "resultsPerPage",
    option.None,
    optional(int),
  )
  use total_results <- optional_field(
    "totalResults",
    option.None,
    optional(int),
  )
  success(PageInfo(results_per_page, total_results))
}