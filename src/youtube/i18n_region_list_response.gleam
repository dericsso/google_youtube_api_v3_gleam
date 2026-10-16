//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/i18n_region.{type I18nRegion}

pub type I18nRegionListResponse {
  I18nRegionListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(I18nRegion)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
