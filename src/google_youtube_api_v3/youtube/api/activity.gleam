import gleam/bool
import gleam/http
import gleam/int
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    channel_id: Option(String),
    home: Option(Bool),
    max_results: Option(Int),
    mine: Option(Bool),
    page_token: Option(String),
    published_after: Option(String),
    published_before: Option(String),
    region_code: Option(String),
  )
}

pub fn list(part: List(String)) -> ListParams {
  ListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.channel_id,
    params.home,
    params.max_results,
    params.mine,
    params.page_token,
    params.published_after,
    params.published_before,
    params.region_code,
  )
}

pub fn list_with_region_code(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.home,
    params.max_results,
    params.mine,
    params.page_token,
    params.published_after,
    params.published_before,
    option.Some(value),
  )
}

pub fn list_with_published_before(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.home,
    params.max_results,
    params.mine,
    params.page_token,
    params.published_after,
    option.Some(value),
    params.region_code,
  )
}

pub fn list_with_published_after(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.home,
    params.max_results,
    params.mine,
    params.page_token,
    option.Some(value),
    params.published_before,
    params.region_code,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.home,
    params.max_results,
    params.mine,
    option.Some(value),
    params.published_after,
    params.published_before,
    params.region_code,
  )
}

pub fn list_with_mine(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.home,
    params.max_results,
    option.Some(value),
    params.page_token,
    params.published_after,
    params.published_before,
    params.region_code,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.home,
    option.Some(value),
    params.mine,
    params.page_token,
    params.published_after,
    params.published_before,
    params.region_code,
  )
}

pub fn list_with_home(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    option.Some(value),
    params.max_results,
    params.mine,
    params.page_token,
    params.published_after,
    params.published_before,
    params.region_code,
  )
}

pub fn list_with_channel_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.home,
    params.max_results,
    params.mine,
    params.page_token,
    params.published_after,
    params.published_before,
    params.region_code,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/activities",
    list.flatten(
      [list.map(params.part, fn(v) { #("part", v) }), case params.channel_id {
          option.Some(v) -> [#("channelId", v)]
          option.None -> []
        }, case params.home {
          option.Some(v) -> [#("home", bool.to_string(v))]
          option.None -> []
        }, case params.max_results {
          option.Some(v) -> [#("maxResults", int.to_string(v))]
          option.None -> []
        }, case params.mine {
          option.Some(v) -> [#("mine", bool.to_string(v))]
          option.None -> []
        }, case params.page_token {
          option.Some(v) -> [#("pageToken", v)]
          option.None -> []
        }, case params.published_after {
          option.Some(v) -> [#("publishedAfter", v)]
          option.None -> []
        }, case params.published_before {
          option.Some(v) -> [#("publishedBefore", v)]
          option.None -> []
        }, case params.region_code {
          option.Some(v) -> [#("regionCode", v)]
          option.None -> []
        }],
    ),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
    ],
    option.None,
  )
}