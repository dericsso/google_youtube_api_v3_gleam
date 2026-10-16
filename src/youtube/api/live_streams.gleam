//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import youtube/live_stream.{type LiveStream}

/// Deletes an existing stream for the authenticated user.
pub type DeleteParams {
  DeleteParams(
    id: String,
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn delete(id: String) -> DeleteParams {
  DeleteParams(id, option.None, option.None)
}

pub fn delete_with_on_behalf_of_content_owner_channel(
  params: DeleteParams,
  value: String,
) -> DeleteParams {
  DeleteParams(params.id, params.on_behalf_of_content_owner, option.Some(value))
}

pub fn delete_with_on_behalf_of_content_owner(
  params: DeleteParams,
  value: String,
) -> DeleteParams {
  DeleteParams(
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/liveStreams",
    list.flatten([
      [#("id", params.id)],
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner_channel {
        option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.None,
  )
}

/// Inserts a new stream for the authenticated user.
pub type InsertParams {
  InsertParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part, option.None, option.None)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn insert_with_on_behalf_of_content_owner_channel(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn insert_with_on_behalf_of_content_owner(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn insert_request(params: InsertParams, body: LiveStream) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveStreams",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner_channel {
        option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.Some(json.to_string(live_stream.to_json(body))),
  )
}

/// Retrieve the list of streams associated with the given channel. --
pub type ListParams {
  ListParams(
    part: List(String),
    id: Option(List(String)),
    max_results: Option(Int),
    mine: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
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
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn list_with_on_behalf_of_content_owner_channel(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.page_token,
  )
}

pub fn list_with_on_behalf_of_content_owner(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.id,
    params.max_results,
    params.mine,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_with_mine(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.id,
    params.max_results,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.id,
    option.Some(value),
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/liveStreams",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
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
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner_channel {
        option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
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
    ],
    option.None,
  )
}

/// Updates an existing stream for the authenticated user.
pub type UpdateParams {
  UpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn update(part: List(String)) -> UpdateParams {
  UpdateParams(part, option.None, option.None)
}

pub fn update_add_part(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn update_with_on_behalf_of_content_owner_channel(
  params: UpdateParams,
  value: String,
) -> UpdateParams {
  UpdateParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn update_with_on_behalf_of_content_owner(
  params: UpdateParams,
  value: String,
) -> UpdateParams {
  UpdateParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn update_request(params: UpdateParams, body: LiveStream) -> Request {
  Request(
    http.Put,
    "youtube/v3/liveStreams",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner_channel {
        option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.Some(json.to_string(live_stream.to_json(body))),
  )
}
