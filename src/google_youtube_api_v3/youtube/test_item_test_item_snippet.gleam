//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}

pub type TestItemTestItemSnippet {
  TestItemTestItemSnippet
}

pub fn decoder() -> Decoder(TestItemTestItemSnippet) {
  decode.success(TestItemTestItemSnippet)
}

pub fn to_json(_value: TestItemTestItemSnippet) -> Json {
  json.object([])
}
