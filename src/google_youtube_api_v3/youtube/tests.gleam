import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}

pub type TestItem {
  TestItem(
    etag: Option(String),
    featured_part: Option(Bool),
    gaia: Option(String),
    id: Option(String),
    snippet: Option(TestItemTestItemSnippet),
  )
}

pub fn test_item_decoder() -> Decoder(TestItem) {
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use featured_part <- decode.optional_field(
    "featuredPart",
    option.None,
    decode.optional(decode.bool),
  )
  use gaia <- decode.optional_field(
    "gaia",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(test_item_test_item_snippet_decoder()),
  )
  decode.success(TestItem(etag, featured_part, gaia, id, snippet))
}

pub fn test_item_to_json(value: TestItem) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("featuredPart", json.nullable(value.featured_part, json.bool)),
    #("gaia", json.nullable(value.gaia, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #(
      "snippet",
      json.nullable(value.snippet, test_item_test_item_snippet_to_json),
    ),
  ])
}

pub type TestItemTestItemSnippet {
  TestItemTestItemSnippet
}

pub fn test_item_test_item_snippet_decoder() -> Decoder(TestItemTestItemSnippet) {
  decode.success(TestItemTestItemSnippet)
}

pub fn test_item_test_item_snippet_to_json(
  _value: TestItemTestItemSnippet,
) -> Json {
  json.object([])
}
