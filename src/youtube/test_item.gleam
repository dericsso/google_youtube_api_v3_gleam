//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import youtube/test_item_test_item_snippet.{type TestItemTestItemSnippet}

pub type TestItem {
  TestItem(
    etag: Option(String),
    featured_part: Option(Bool),
    gaia: Option(String),
    id: Option(String),
    snippet: Option(TestItemTestItemSnippet),
  )
}

pub fn decoder() -> Decoder(TestItem) {
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
    decode.optional(test_item_test_item_snippet.decoder()),
  )
  decode.success(TestItem(etag, featured_part, gaia, id, snippet))
}

pub fn to_json(value: TestItem) -> Json {
  json.object([
    #("etag", json.nullable(value.etag, json.string)),
    #("featuredPart", json.nullable(value.featured_part, json.bool)),
    #("gaia", json.nullable(value.gaia, json.string)),
    #("id", json.nullable(value.id, json.string)),
    #(
      "snippet",
      json.nullable(value.snippet, test_item_test_item_snippet.to_json),
    ),
  ])
}
