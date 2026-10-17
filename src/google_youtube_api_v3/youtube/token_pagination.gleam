import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}

/// Stub token pagination template to suppress results.
pub type TokenPagination {
  TokenPagination
}

pub fn token_pagination_decoder() -> Decoder(TokenPagination) {
  decode.success(TokenPagination)
}

pub fn token_pagination_to_json(_value: TokenPagination) -> Json {
  json.object([])
}