import gleam/http
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of resources, possibly filtered.
pub type I18nLanguagesListParams {
  I18nLanguagesListParams(part: List(String), hl: Option(String))
}

pub fn i18n_languages_list(part: List(String)) -> I18nLanguagesListParams {
  I18nLanguagesListParams(part, option.None)
}

pub fn i18n_languages_list_add_part(
  params: I18nLanguagesListParams,
  value: String,
) -> I18nLanguagesListParams {
  I18nLanguagesListParams(list.append(params.part, [value]), params.hl)
}

pub fn i18n_languages_list_with_hl(
  params: I18nLanguagesListParams,
  value: String,
) -> I18nLanguagesListParams {
  I18nLanguagesListParams(params.part, option.Some(value))
}

pub fn i18n_languages_list_request(params: I18nLanguagesListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/i18nLanguages",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type I18nRegionsListParams {
  I18nRegionsListParams(part: List(String), hl: Option(String))
}

pub fn i18n_regions_list(part: List(String)) -> I18nRegionsListParams {
  I18nRegionsListParams(part, option.None)
}

pub fn i18n_regions_list_add_part(
  params: I18nRegionsListParams,
  value: String,
) -> I18nRegionsListParams {
  I18nRegionsListParams(list.append(params.part, [value]), params.hl)
}

pub fn i18n_regions_list_with_hl(
  params: I18nRegionsListParams,
  value: String,
) -> I18nRegionsListParams {
  I18nRegionsListParams(params.part, option.Some(value))
}

pub fn i18n_regions_list_request(params: I18nRegionsListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/i18nRegions",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}
