//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}

/// Stub token pagination template to suppress results.
pub type TokenPagination {
  TokenPagination
}

pub fn decoder() -> Decoder(TokenPagination) {
  decode.success(TokenPagination)
}