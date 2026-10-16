//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/i18n_language.{type I18nLanguage}

pub type I18nLanguageListResponse {
  I18nLanguageListResponse(
    etag: option.Option(String),
    event_id: option.Option(String),
    items: option.Option(List(I18nLanguage)),
    kind: option.Option(String),
    visitor_id: option.Option(String),
  )
}
