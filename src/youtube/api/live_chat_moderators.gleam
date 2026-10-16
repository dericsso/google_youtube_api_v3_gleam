//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import youtube/live_chat_moderator.{type LiveChatModerator}

/// Deletes a chat moderator.
pub type DeleteParams {
  DeleteParams(id: String)
}

pub fn delete(id: String) -> DeleteParams {
  DeleteParams(id)
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/liveChat/moderators",
    list.flatten([[#("id", params.id)]]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.None,
  )
}

/// Inserts a new resource into this collection.
pub type InsertParams {
  InsertParams(part: List(String))
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(list.append(params.part, [value]))
}

pub fn insert_request(
  params: InsertParams,
  body: LiveChatModerator,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveChat/moderators",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.Some(json.to_string(live_chat_moderator.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    live_chat_id: String,
    part: List(String),
    max_results: Option(Int),
    page_token: Option(String),
  )
}

pub fn list(live_chat_id: String, part: List(String)) -> ListParams {
  ListParams(live_chat_id, part, option.None, option.None)
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.live_chat_id,
    list.append(params.part, [value]),
    params.max_results,
    params.page_token,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.live_chat_id,
    params.part,
    params.max_results,
    option.Some(value),
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.live_chat_id,
    params.part,
    option.Some(value),
    params.page_token,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/liveChat/moderators",
    list.flatten([
      [#("liveChatId", params.live_chat_id)],
      list.map(params.part, fn(v) { #("part", v) }),
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
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
