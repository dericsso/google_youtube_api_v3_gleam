//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
