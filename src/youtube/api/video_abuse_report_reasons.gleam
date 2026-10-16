//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(part: List(String), hl: Option(String))
}

pub fn list(part: List(String)) -> ListParams {
  ListParams(part, option.None)
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(list.append(params.part, [value]), params.hl)
}

pub fn list_with_hl(params: ListParams, value: String) -> ListParams {
  ListParams(params.part, option.Some(value))
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/videoAbuseReportReasons",
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
    ],
    option.None,
  )
}
