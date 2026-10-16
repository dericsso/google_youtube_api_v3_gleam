//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    hl: Option(String),
    id: Option(List(String)),
    region_code: Option(String),
  )
}

pub fn list(part: List(String)) -> ListParams {
  ListParams(part, option.None, option.None, option.None)
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.hl,
    params.id,
    params.region_code,
  )
}

pub fn list_with_region_code(params: ListParams, value: String) -> ListParams {
  ListParams(params.part, params.hl, params.id, option.Some(value))
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(params.part, params.hl, option.Some(value), params.region_code)
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.hl,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.region_code,
  )
}

pub fn list_with_hl(params: ListParams, value: String) -> ListParams {
  ListParams(params.part, option.Some(value), params.id, params.region_code)
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    request.Get,
    "youtube/v3/videoCategories",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.region_code {
        option.Some(v) -> [#("regionCode", v)]
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
