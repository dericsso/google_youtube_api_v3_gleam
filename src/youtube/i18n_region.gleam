//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/i18n_region_snippet.{type I18nRegionSnippet}

/// A *i18nRegion* resource identifies a region where YouTube is available.
pub type I18nRegion {
  I18nRegion(
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(I18nRegionSnippet),
  )
}

pub fn decoder() -> Decoder(I18nRegion) {
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(i18n_region_snippet.decoder()),
  )
  success(I18nRegion(etag, id, kind, snippet))
}