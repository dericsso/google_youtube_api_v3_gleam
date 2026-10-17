//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/list
import gleam/option
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of all pricing levels offered by a creator to the fans.
pub type ListParams {
  ListParams(part: List(String))
}

pub fn list(part: List(String)) -> ListParams {
  ListParams(part)
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(list.append(params.part, [value]))
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/membershipsLevels",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.channel-memberships.creator"],
    option.None,
  )
}