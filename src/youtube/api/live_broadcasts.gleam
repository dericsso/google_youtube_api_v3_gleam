//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import youtube/cuepoint.{type Cuepoint}
import youtube/live_broadcast.{type LiveBroadcast}

/// Bind a broadcast to a stream.
pub type BindParams {
  BindParams(
    id: String,
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    stream_id: Option(String),
  )
}

pub fn bind(id: String, part: List(String)) -> BindParams {
  BindParams(id, part, option.None, option.None, option.None)
}

pub fn bind_add_part(params: BindParams, value: String) -> BindParams {
  BindParams(
    params.id,
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stream_id,
  )
}

pub fn bind_with_stream_id(params: BindParams, value: String) -> BindParams {
  BindParams(
    params.id,
    params.part,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn bind_with_on_behalf_of_content_owner_channel(
  params: BindParams,
  value: String,
) -> BindParams {
  BindParams(
    params.id,
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.stream_id,
  )
}

pub fn bind_with_on_behalf_of_content_owner(
  params: BindParams,
  value: String,
) -> BindParams {
  BindParams(
    params.id,
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.stream_id,
  )
}

pub fn bind_request(params: BindParams) -> Request {
  Request(
    request.Post,
    "youtube/v3/liveBroadcasts/bind",
    list.flatten([
      [#("id", params.id)],
      list.map(params.part, fn(v) { #("part", v) }),
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner_channel {
        option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
        option.None -> []
      },
      case params.stream_id {
        option.Some(v) -> [#("streamId", v)]
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

/// Delete a given broadcast.
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
    request.Delete,
    "youtube/v3/liveBroadcasts",
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

pub fn insert_request(params: InsertParams, body: LiveBroadcast) -> Request {
  Request(
    request.Post,
    "youtube/v3/liveBroadcasts",
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
    option.Some(json.to_string(live_broadcast.to_json(body))),
  )
}

/// Insert cuepoints in a broadcast
pub type InsertCuepointParams {
  InsertCuepointParams(
    id: Option(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    part: Option(List(String)),
  )
}

pub fn insert_cuepoint() -> InsertCuepointParams {
  InsertCuepointParams(option.None, option.None, option.None, option.None)
}

pub fn insert_cuepoint_with_part(
  params: InsertCuepointParams,
  value: List(String),
) -> InsertCuepointParams {
  InsertCuepointParams(
    params.id,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn insert_cuepoint_add_part(
  params: InsertCuepointParams,
  value: String,
) -> InsertCuepointParams {
  InsertCuepointParams(
    params.id,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    case params.part {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn insert_cuepoint_with_on_behalf_of_content_owner_channel(
  params: InsertCuepointParams,
  value: String,
) -> InsertCuepointParams {
  InsertCuepointParams(
    params.id,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.part,
  )
}

pub fn insert_cuepoint_with_on_behalf_of_content_owner(
  params: InsertCuepointParams,
  value: String,
) -> InsertCuepointParams {
  InsertCuepointParams(
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.part,
  )
}

pub fn insert_cuepoint_with_id(
  params: InsertCuepointParams,
  value: String,
) -> InsertCuepointParams {
  InsertCuepointParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.part,
  )
}

pub fn insert_cuepoint_request(
  params: InsertCuepointParams,
  body: Cuepoint,
) -> Request {
  Request(
    request.Post,
    "youtube/v3/liveBroadcasts/cuepoint",
    list.flatten([
      case params.id {
        option.Some(v) -> [#("id", v)]
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
      case params.part {
        option.Some(v) -> list.map(v, fn(w) { #("part", w) })
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(cuepoint.to_json(body))),
  )
}

/// Retrieve the list of broadcasts associated with the given channel.
pub type ListParams {
  ListParams(
    part: List(String),
    broadcast_status: Option(ListBroadcastStatus),
    broadcast_type: Option(ListBroadcastType),
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
    option.None,
    option.None,
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.broadcast_status,
    params.broadcast_type,
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
    params.broadcast_status,
    params.broadcast_type,
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
    params.broadcast_status,
    params.broadcast_type,
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
    params.broadcast_status,
    params.broadcast_type,
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
    params.broadcast_status,
    params.broadcast_type,
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
    params.broadcast_status,
    params.broadcast_type,
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
    params.broadcast_status,
    params.broadcast_type,
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
    params.broadcast_status,
    params.broadcast_type,
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

pub fn list_with_broadcast_type(
  params: ListParams,
  value: ListBroadcastType,
) -> ListParams {
  ListParams(
    params.part,
    params.broadcast_status,
    option.Some(value),
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_with_broadcast_status(
  params: ListParams,
  value: ListBroadcastStatus,
) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.broadcast_type,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    request.Get,
    "youtube/v3/liveBroadcasts",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.broadcast_status {
        option.Some(v) -> [
          #("broadcastStatus", list_broadcast_status_to_string(v)),
        ]
        option.None -> []
      },
      case params.broadcast_type {
        option.Some(v) -> [
          #("broadcastType", list_broadcast_type_to_string(v)),
        ]
        option.None -> []
      },
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

/// Transition a broadcast to a given status.
pub type TransitionParams {
  TransitionParams(
    broadcast_status: TransitionBroadcastStatus,
    id: String,
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn transition(
  broadcast_status: TransitionBroadcastStatus,
  id: String,
  part: List(String),
) -> TransitionParams {
  TransitionParams(broadcast_status, id, part, option.None, option.None)
}

pub fn transition_add_part(
  params: TransitionParams,
  value: String,
) -> TransitionParams {
  TransitionParams(
    params.broadcast_status,
    params.id,
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn transition_with_on_behalf_of_content_owner_channel(
  params: TransitionParams,
  value: String,
) -> TransitionParams {
  TransitionParams(
    params.broadcast_status,
    params.id,
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn transition_with_on_behalf_of_content_owner(
  params: TransitionParams,
  value: String,
) -> TransitionParams {
  TransitionParams(
    params.broadcast_status,
    params.id,
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn transition_request(params: TransitionParams) -> Request {
  Request(
    request.Post,
    "youtube/v3/liveBroadcasts/transition",
    list.flatten([
      [
        #(
          "broadcastStatus",
          transition_broadcast_status_to_string(params.broadcast_status),
        ),
      ],
      [#("id", params.id)],
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
    option.None,
  )
}

/// Updates an existing broadcast for the authenticated user.
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

pub fn update_request(params: UpdateParams, body: LiveBroadcast) -> Request {
  Request(
    request.Put,
    "youtube/v3/liveBroadcasts",
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
    option.Some(json.to_string(live_broadcast.to_json(body))),
  )
}

/// Return broadcasts with a certain status, e.g. active broadcasts.
pub type ListBroadcastStatus {
  ListBroadcastStatusBroadcastStatusFilterUnspecified
  ListBroadcastStatusAll
  ListBroadcastStatusActive
  ListBroadcastStatusUpcoming
  ListBroadcastStatusCompleted
}

pub fn list_broadcast_status_to_string(value: ListBroadcastStatus) -> String {
  case value {
    ListBroadcastStatusBroadcastStatusFilterUnspecified ->
      "broadcastStatusFilterUnspecified"
    ListBroadcastStatusAll -> "all"
    ListBroadcastStatusActive -> "active"
    ListBroadcastStatusUpcoming -> "upcoming"
    ListBroadcastStatusCompleted -> "completed"
  }
}

pub fn list_broadcast_status_decoder() -> Decoder(ListBroadcastStatus) {
  use value <- decode.then(decode.string)
  case value {
    "broadcastStatusFilterUnspecified" ->
      decode.success(ListBroadcastStatusBroadcastStatusFilterUnspecified)
    "all" -> decode.success(ListBroadcastStatusAll)
    "active" -> decode.success(ListBroadcastStatusActive)
    "upcoming" -> decode.success(ListBroadcastStatusUpcoming)
    "completed" -> decode.success(ListBroadcastStatusCompleted)
    _ ->
      decode.failure(
        ListBroadcastStatusBroadcastStatusFilterUnspecified,
        "a valid ListBroadcastStatus",
      )
  }
}

/// Return only broadcasts with the selected type.
pub type ListBroadcastType {
  ListBroadcastTypeBroadcastTypeFilterUnspecified
  ListBroadcastTypeAll
  ListBroadcastTypeEvent
  ListBroadcastTypePersistent
}

pub fn list_broadcast_type_to_string(value: ListBroadcastType) -> String {
  case value {
    ListBroadcastTypeBroadcastTypeFilterUnspecified ->
      "broadcastTypeFilterUnspecified"
    ListBroadcastTypeAll -> "all"
    ListBroadcastTypeEvent -> "event"
    ListBroadcastTypePersistent -> "persistent"
  }
}

pub fn list_broadcast_type_decoder() -> Decoder(ListBroadcastType) {
  use value <- decode.then(decode.string)
  case value {
    "broadcastTypeFilterUnspecified" ->
      decode.success(ListBroadcastTypeBroadcastTypeFilterUnspecified)
    "all" -> decode.success(ListBroadcastTypeAll)
    "event" -> decode.success(ListBroadcastTypeEvent)
    "persistent" -> decode.success(ListBroadcastTypePersistent)
    _ ->
      decode.failure(
        ListBroadcastTypeBroadcastTypeFilterUnspecified,
        "a valid ListBroadcastType",
      )
  }
}

/// The status to which the broadcast is going to transition.
pub type TransitionBroadcastStatus {
  TransitionBroadcastStatusStatusUnspecified
  TransitionBroadcastStatusTesting
  TransitionBroadcastStatusLive
  TransitionBroadcastStatusComplete
}

pub fn transition_broadcast_status_to_string(
  value: TransitionBroadcastStatus,
) -> String {
  case value {
    TransitionBroadcastStatusStatusUnspecified -> "statusUnspecified"
    TransitionBroadcastStatusTesting -> "testing"
    TransitionBroadcastStatusLive -> "live"
    TransitionBroadcastStatusComplete -> "complete"
  }
}

pub fn transition_broadcast_status_decoder() -> Decoder(
  TransitionBroadcastStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "statusUnspecified" ->
      decode.success(TransitionBroadcastStatusStatusUnspecified)
    "testing" -> decode.success(TransitionBroadcastStatusTesting)
    "live" -> decode.success(TransitionBroadcastStatusLive)
    "complete" -> decode.success(TransitionBroadcastStatusComplete)
    _ ->
      decode.failure(
        TransitionBroadcastStatusStatusUnspecified,
        "a valid TransitionBroadcastStatus",
      )
  }
}
