//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, bool, success}
import gleam/option
import youtube/test_item_test_item_snippet.{type TestItemTestItemSnippet}

pub type TestItem {
  TestItem(
    etag: option.Option(String),
    featured_part: option.Option(Bool),
    gaia: option.Option(String),
    id: option.Option(String),
    snippet: option.Option(TestItemTestItemSnippet),
  )
}

pub fn decoder() -> Decoder(TestItem) {
  use etag <- optional_field("etag", option.None, optional(string))
  use featured_part <- optional_field(
    "featuredPart",
    option.None,
    optional(bool),
  )
  use gaia <- optional_field("gaia", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(test_item_test_item_snippet.decoder()),
  )
  success(TestItem(etag, featured_part, gaia, id, snippet))
}