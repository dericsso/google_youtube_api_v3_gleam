//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}

/// Stub token pagination template to suppress results.
pub type TokenPagination {
  TokenPagination
}

pub fn decoder() -> Decoder(TokenPagination) {
  decode.success(TokenPagination)
}

pub fn to_json(_value: TokenPagination) -> Json {
  json.object([])
}