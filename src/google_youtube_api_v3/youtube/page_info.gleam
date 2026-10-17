//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

/// Paging details for lists of resources, including total number of items available and number of resources returned in a single page.
pub type PageInfo {
  PageInfo(results_per_page: Option(Int), total_results: Option(Int))
}

pub fn page_info_decoder() -> Decoder(PageInfo) {
  use results_per_page <- decode.optional_field(
    "resultsPerPage",
    option.None,
    decode.optional(decode.int),
  )
  use total_results <- decode.optional_field(
    "totalResults",
    option.None,
    decode.optional(decode.int),
  )
  decode.success(PageInfo(results_per_page, total_results))
}

pub fn page_info_to_json(value: PageInfo) -> Json {
  json.object(
    [
      #("resultsPerPage", json.nullable(value.results_per_page, json.int)),
      #("totalResults", json.nullable(value.total_results, json.int)),
    ],
  )
}