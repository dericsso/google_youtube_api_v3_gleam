//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
