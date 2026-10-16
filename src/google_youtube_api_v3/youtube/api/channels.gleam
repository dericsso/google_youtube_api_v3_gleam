//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/channel.{type Channel}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    category_id: Option(String),
    for_handle: Option(String),
    for_username: Option(String),
    hl: Option(String),
    id: Option(List(String)),
    managed_by_me: Option(Bool),
    max_results: Option(Int),
    mine: Option(Bool),
    my_subscribers: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    page_token: Option(String),
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
    option.None,
    option.None,
    option.None,
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn list_with_on_behalf_of_content_owner(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    option.Some(value),
    params.page_token,
  )
}

pub fn list_with_my_subscribers(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_mine(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    option.Some(value),
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    option.Some(value),
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_managed_by_me(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    option.Some(value),
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    option.Some(value),
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    params.hl,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_hl(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    params.for_username,
    option.Some(value),
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_for_username(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    params.for_handle,
    option.Some(value),
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_for_handle(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.category_id,
    option.Some(value),
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_with_category_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.for_handle,
    params.for_username,
    params.hl,
    params.id,
    params.managed_by_me,
    params.max_results,
    params.mine,
    params.my_subscribers,
    params.on_behalf_of_content_owner,
    params.page_token,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/channels",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.category_id {
        option.Some(v) -> [#("categoryId", v)]
        option.None -> []
      },
      case params.for_handle {
        option.Some(v) -> [#("forHandle", v)]
        option.None -> []
      },
      case params.for_username {
        option.Some(v) -> [#("forUsername", v)]
        option.None -> []
      },
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.managed_by_me {
        option.Some(v) -> [#("managedByMe", bool.to_string(v))]
        option.None -> []
      },
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
        option.None -> []
      },
      case params.mine {
        option.Some(v) -> [#("mine", bool.to_string(v))]
        option.None -> []
      },
      case params.my_subscribers {
        option.Some(v) -> [#("mySubscribers", bool.to_string(v))]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.page_token {
        option.Some(v) -> [#("pageToken", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
      "https://www.googleapis.com/auth/youtubepartner",
      "https://www.googleapis.com/auth/youtubepartner-channel-audit",
    ],
    option.None,
  )
}

/// Updates an existing resource.
pub type UpdateParams {
  UpdateParams(part: List(String), on_behalf_of_content_owner: Option(String))
}

pub fn update(part: List(String)) -> UpdateParams {
  UpdateParams(part, option.None)
}

pub fn update_add_part(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn update_with_on_behalf_of_content_owner(
  params: UpdateParams,
  value: String,
) -> UpdateParams {
  UpdateParams(params.part, option.Some(value))
}

pub fn update_request(params: UpdateParams, body: Channel) -> Request {
  Request(
    http.Put,
    "youtube/v3/channels",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(channel.to_json(body))),
  )
}
