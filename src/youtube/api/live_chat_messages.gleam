//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import youtube/live_chat_message.{type LiveChatMessage}

/// Deletes a chat message. A call to this method has a quota cost of 20 units.
pub type DeleteParams {
  DeleteParams(id: String)
}

pub fn delete(id: String) -> DeleteParams {
  DeleteParams(id)
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/liveChat/messages",
    list.flatten([[#("id", params.id)]]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.None,
  )
}

/// Inserts a new resource into this collection. A call to this method has a quota cost of 20 units.
pub type InsertParams {
  InsertParams(part: List(String))
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(list.append(params.part, [value]))
}

pub fn insert_request(params: InsertParams, body: LiveChatMessage) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveChat/messages",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.Some(json.to_string(live_chat_message.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered. A call to this method has a quota cost of 5 units.
pub type ListParams {
  ListParams(
    live_chat_id: String,
    part: List(String),
    hl: Option(String),
    max_results: Option(Int),
    page_token: Option(String),
    profile_image_size: Option(Int),
  )
}

pub fn list(live_chat_id: String, part: List(String)) -> ListParams {
  ListParams(
    live_chat_id,
    part,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.live_chat_id,
    list.append(params.part, [value]),
    params.hl,
    params.max_results,
    params.page_token,
    params.profile_image_size,
  )
}

pub fn list_with_profile_image_size(
  params: ListParams,
  value: Int,
) -> ListParams {
  ListParams(
    params.live_chat_id,
    params.part,
    params.hl,
    params.max_results,
    params.page_token,
    option.Some(value),
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.live_chat_id,
    params.part,
    params.hl,
    params.max_results,
    option.Some(value),
    params.profile_image_size,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.live_chat_id,
    params.part,
    params.hl,
    option.Some(value),
    params.page_token,
    params.profile_image_size,
  )
}

pub fn list_with_hl(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.live_chat_id,
    params.part,
    option.Some(value),
    params.max_results,
    params.page_token,
    params.profile_image_size,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/liveChat/messages",
    list.flatten([
      [#("liveChatId", params.live_chat_id)],
      list.map(params.part, fn(v) { #("part", v) }),
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
        option.None -> []
      },
      case params.page_token {
        option.Some(v) -> [#("pageToken", v)]
        option.None -> []
      },
      case params.profile_image_size {
        option.Some(v) -> [#("profileImageSize", int.to_string(v))]
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

/// Transitions a durable chat event. A call to this method has a quota cost of 20 units.
pub type TransitionParams {
  TransitionParams(id: Option(String), status: Option(TransitionStatus))
}

pub fn transition() -> TransitionParams {
  TransitionParams(option.None, option.None)
}

pub fn transition_with_status(
  params: TransitionParams,
  value: TransitionStatus,
) -> TransitionParams {
  TransitionParams(params.id, option.Some(value))
}

pub fn transition_with_id(
  params: TransitionParams,
  value: String,
) -> TransitionParams {
  TransitionParams(option.Some(value), params.status)
}

pub fn transition_request(params: TransitionParams) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveChat/messages/transition",
    list.flatten([
      case params.id {
        option.Some(v) -> [#("id", v)]
        option.None -> []
      },
      case params.status {
        option.Some(v) -> [#("status", transition_status_to_string(v))]
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

/// The status to which the chat event is going to transition.
pub type TransitionStatus {
  TransitionStatusStatusUnspecified
  TransitionStatusClosed
}

pub fn transition_status_to_string(value: TransitionStatus) -> String {
  case value {
    TransitionStatusStatusUnspecified -> "statusUnspecified"
    TransitionStatusClosed -> "closed"
  }
}

pub fn transition_status_decoder() -> Decoder(TransitionStatus) {
  use value <- decode.then(decode.string)
  case value {
    "statusUnspecified" -> decode.success(TransitionStatusStatusUnspecified)
    "closed" -> decode.success(TransitionStatusClosed)
    _ ->
      decode.failure(
        TransitionStatusStatusUnspecified,
        "a valid TransitionStatus",
      )
  }
}
