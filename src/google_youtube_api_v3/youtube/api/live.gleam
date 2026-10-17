import gleam/bool
import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/cuepoint.{type Cuepoint}
import google_youtube_api_v3/youtube/live.{
  type LiveBroadcast, type LiveChatBan, type LiveChatMessage,
  type LiveChatModerator, type LiveStream,
}

/// Bind a broadcast to a stream.
pub type LiveBroadcastsBindParams {
  LiveBroadcastsBindParams(
    id: String,
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    stream_id: Option(String),
  )
}

pub fn live_broadcasts_bind(
  id: String,
  part: List(String),
) -> LiveBroadcastsBindParams {
  LiveBroadcastsBindParams(id, part, option.None, option.None, option.None)
}

pub fn live_broadcasts_bind_add_part(
  params: LiveBroadcastsBindParams,
  value: String,
) -> LiveBroadcastsBindParams {
  LiveBroadcastsBindParams(
    params.id,
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.stream_id,
  )
}

pub fn live_broadcasts_bind_with_stream_id(
  params: LiveBroadcastsBindParams,
  value: String,
) -> LiveBroadcastsBindParams {
  LiveBroadcastsBindParams(
    params.id,
    params.part,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn live_broadcasts_bind_with_on_behalf_of_content_owner_channel(
  params: LiveBroadcastsBindParams,
  value: String,
) -> LiveBroadcastsBindParams {
  LiveBroadcastsBindParams(
    params.id,
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.stream_id,
  )
}

pub fn live_broadcasts_bind_with_on_behalf_of_content_owner(
  params: LiveBroadcastsBindParams,
  value: String,
) -> LiveBroadcastsBindParams {
  LiveBroadcastsBindParams(
    params.id,
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.stream_id,
  )
}

pub fn live_broadcasts_bind_request(
  params: LiveBroadcastsBindParams,
) -> Request {
  Request(
    http.Post,
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
pub type LiveBroadcastsDeleteParams {
  LiveBroadcastsDeleteParams(
    id: String,
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn live_broadcasts_delete(id: String) -> LiveBroadcastsDeleteParams {
  LiveBroadcastsDeleteParams(id, option.None, option.None)
}

pub fn live_broadcasts_delete_with_on_behalf_of_content_owner_channel(
  params: LiveBroadcastsDeleteParams,
  value: String,
) -> LiveBroadcastsDeleteParams {
  LiveBroadcastsDeleteParams(
    params.id,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn live_broadcasts_delete_with_on_behalf_of_content_owner(
  params: LiveBroadcastsDeleteParams,
  value: String,
) -> LiveBroadcastsDeleteParams {
  LiveBroadcastsDeleteParams(
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_broadcasts_delete_request(
  params: LiveBroadcastsDeleteParams,
) -> Request {
  Request(
    http.Delete,
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
pub type LiveBroadcastsInsertParams {
  LiveBroadcastsInsertParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn live_broadcasts_insert(
  part: List(String),
) -> LiveBroadcastsInsertParams {
  LiveBroadcastsInsertParams(part, option.None, option.None)
}

pub fn live_broadcasts_insert_add_part(
  params: LiveBroadcastsInsertParams,
  value: String,
) -> LiveBroadcastsInsertParams {
  LiveBroadcastsInsertParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_broadcasts_insert_with_on_behalf_of_content_owner_channel(
  params: LiveBroadcastsInsertParams,
  value: String,
) -> LiveBroadcastsInsertParams {
  LiveBroadcastsInsertParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn live_broadcasts_insert_with_on_behalf_of_content_owner(
  params: LiveBroadcastsInsertParams,
  value: String,
) -> LiveBroadcastsInsertParams {
  LiveBroadcastsInsertParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_broadcasts_insert_request(
  params: LiveBroadcastsInsertParams,
  body: LiveBroadcast,
) -> Request {
  Request(
    http.Post,
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
    option.Some(json.to_string(live.live_broadcast_to_json(body))),
  )
}

/// Insert cuepoints in a broadcast
pub type LiveBroadcastsInsertCuepointParams {
  LiveBroadcastsInsertCuepointParams(
    id: Option(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    part: Option(List(String)),
  )
}

pub fn live_broadcasts_insert_cuepoint() -> LiveBroadcastsInsertCuepointParams {
  LiveBroadcastsInsertCuepointParams(
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn live_broadcasts_insert_cuepoint_with_part(
  params: LiveBroadcastsInsertCuepointParams,
  value: List(String),
) -> LiveBroadcastsInsertCuepointParams {
  LiveBroadcastsInsertCuepointParams(
    params.id,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn live_broadcasts_insert_cuepoint_add_part(
  params: LiveBroadcastsInsertCuepointParams,
  value: String,
) -> LiveBroadcastsInsertCuepointParams {
  LiveBroadcastsInsertCuepointParams(
    params.id,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    case params.part {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn live_broadcasts_insert_cuepoint_with_on_behalf_of_content_owner_channel(
  params: LiveBroadcastsInsertCuepointParams,
  value: String,
) -> LiveBroadcastsInsertCuepointParams {
  LiveBroadcastsInsertCuepointParams(
    params.id,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.part,
  )
}

pub fn live_broadcasts_insert_cuepoint_with_on_behalf_of_content_owner(
  params: LiveBroadcastsInsertCuepointParams,
  value: String,
) -> LiveBroadcastsInsertCuepointParams {
  LiveBroadcastsInsertCuepointParams(
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.part,
  )
}

pub fn live_broadcasts_insert_cuepoint_with_id(
  params: LiveBroadcastsInsertCuepointParams,
  value: String,
) -> LiveBroadcastsInsertCuepointParams {
  LiveBroadcastsInsertCuepointParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.part,
  )
}

pub fn live_broadcasts_insert_cuepoint_request(
  params: LiveBroadcastsInsertCuepointParams,
  body: Cuepoint,
) -> Request {
  Request(
    http.Post,
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
    option.Some(json.to_string(cuepoint.cuepoint_to_json(body))),
  )
}

/// Retrieve the list of broadcasts associated with the given channel.
pub type LiveBroadcastsListParams {
  LiveBroadcastsListParams(
    part: List(String),
    broadcast_status: Option(LiveBroadcastsListBroadcastStatus),
    broadcast_type: Option(LiveBroadcastsListBroadcastType),
    id: Option(List(String)),
    max_results: Option(Int),
    mine: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    page_token: Option(String),
  )
}

pub fn live_broadcasts_list(part: List(String)) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_add_part(
  params: LiveBroadcastsListParams,
  value: String,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_page_token(
  params: LiveBroadcastsListParams,
  value: String,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_on_behalf_of_content_owner_channel(
  params: LiveBroadcastsListParams,
  value: String,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_on_behalf_of_content_owner(
  params: LiveBroadcastsListParams,
  value: String,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_mine(
  params: LiveBroadcastsListParams,
  value: Bool,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_max_results(
  params: LiveBroadcastsListParams,
  value: Int,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_id(
  params: LiveBroadcastsListParams,
  value: List(String),
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_add_id(
  params: LiveBroadcastsListParams,
  value: String,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_broadcast_type(
  params: LiveBroadcastsListParams,
  value: LiveBroadcastsListBroadcastType,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_with_broadcast_status(
  params: LiveBroadcastsListParams,
  value: LiveBroadcastsListBroadcastStatus,
) -> LiveBroadcastsListParams {
  LiveBroadcastsListParams(
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

pub fn live_broadcasts_list_request(
  params: LiveBroadcastsListParams,
) -> Request {
  Request(
    http.Get,
    "youtube/v3/liveBroadcasts",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.broadcast_status {
        option.Some(v) -> [
          #(
            "broadcastStatus",
            live_broadcasts_list_broadcast_status_to_string(v),
          ),
        ]
        option.None -> []
      },
      case params.broadcast_type {
        option.Some(v) -> [
          #("broadcastType", live_broadcasts_list_broadcast_type_to_string(v)),
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
pub type LiveBroadcastsTransitionParams {
  LiveBroadcastsTransitionParams(
    broadcast_status: LiveBroadcastsTransitionBroadcastStatus,
    id: String,
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn live_broadcasts_transition(
  broadcast_status: LiveBroadcastsTransitionBroadcastStatus,
  id: String,
  part: List(String),
) -> LiveBroadcastsTransitionParams {
  LiveBroadcastsTransitionParams(
    broadcast_status,
    id,
    part,
    option.None,
    option.None,
  )
}

pub fn live_broadcasts_transition_add_part(
  params: LiveBroadcastsTransitionParams,
  value: String,
) -> LiveBroadcastsTransitionParams {
  LiveBroadcastsTransitionParams(
    params.broadcast_status,
    params.id,
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_broadcasts_transition_with_on_behalf_of_content_owner_channel(
  params: LiveBroadcastsTransitionParams,
  value: String,
) -> LiveBroadcastsTransitionParams {
  LiveBroadcastsTransitionParams(
    params.broadcast_status,
    params.id,
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn live_broadcasts_transition_with_on_behalf_of_content_owner(
  params: LiveBroadcastsTransitionParams,
  value: String,
) -> LiveBroadcastsTransitionParams {
  LiveBroadcastsTransitionParams(
    params.broadcast_status,
    params.id,
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_broadcasts_transition_request(
  params: LiveBroadcastsTransitionParams,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveBroadcasts/transition",
    list.flatten([
      [
        #(
          "broadcastStatus",
          live_broadcasts_transition_broadcast_status_to_string(
            params.broadcast_status,
          ),
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
pub type LiveBroadcastsUpdateParams {
  LiveBroadcastsUpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn live_broadcasts_update(
  part: List(String),
) -> LiveBroadcastsUpdateParams {
  LiveBroadcastsUpdateParams(part, option.None, option.None)
}

pub fn live_broadcasts_update_add_part(
  params: LiveBroadcastsUpdateParams,
  value: String,
) -> LiveBroadcastsUpdateParams {
  LiveBroadcastsUpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_broadcasts_update_with_on_behalf_of_content_owner_channel(
  params: LiveBroadcastsUpdateParams,
  value: String,
) -> LiveBroadcastsUpdateParams {
  LiveBroadcastsUpdateParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn live_broadcasts_update_with_on_behalf_of_content_owner(
  params: LiveBroadcastsUpdateParams,
  value: String,
) -> LiveBroadcastsUpdateParams {
  LiveBroadcastsUpdateParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_broadcasts_update_request(
  params: LiveBroadcastsUpdateParams,
  body: LiveBroadcast,
) -> Request {
  Request(
    http.Put,
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
    option.Some(json.to_string(live.live_broadcast_to_json(body))),
  )
}

/// Deletes a chat ban.
pub type LiveChatBansDeleteParams {
  LiveChatBansDeleteParams(id: String)
}

pub fn live_chat_bans_delete(id: String) -> LiveChatBansDeleteParams {
  LiveChatBansDeleteParams(id)
}

pub fn live_chat_bans_delete_request(
  params: LiveChatBansDeleteParams,
) -> Request {
  Request(
    http.Delete,
    "youtube/v3/liveChat/bans",
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
pub type LiveChatBansInsertParams {
  LiveChatBansInsertParams(part: List(String))
}

pub fn live_chat_bans_insert(part: List(String)) -> LiveChatBansInsertParams {
  LiveChatBansInsertParams(part)
}

pub fn live_chat_bans_insert_add_part(
  params: LiveChatBansInsertParams,
  value: String,
) -> LiveChatBansInsertParams {
  LiveChatBansInsertParams(list.append(params.part, [value]))
}

pub fn live_chat_bans_insert_request(
  params: LiveChatBansInsertParams,
  body: LiveChatBan,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveChat/bans",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.Some(json.to_string(live.live_chat_ban_to_json(body))),
  )
}

/// Deletes a chat message. A call to this method has a quota cost of 20 units.
pub type LiveChatMessagesDeleteParams {
  LiveChatMessagesDeleteParams(id: String)
}

pub fn live_chat_messages_delete(id: String) -> LiveChatMessagesDeleteParams {
  LiveChatMessagesDeleteParams(id)
}

pub fn live_chat_messages_delete_request(
  params: LiveChatMessagesDeleteParams,
) -> Request {
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
pub type LiveChatMessagesInsertParams {
  LiveChatMessagesInsertParams(part: List(String))
}

pub fn live_chat_messages_insert(
  part: List(String),
) -> LiveChatMessagesInsertParams {
  LiveChatMessagesInsertParams(part)
}

pub fn live_chat_messages_insert_add_part(
  params: LiveChatMessagesInsertParams,
  value: String,
) -> LiveChatMessagesInsertParams {
  LiveChatMessagesInsertParams(list.append(params.part, [value]))
}

pub fn live_chat_messages_insert_request(
  params: LiveChatMessagesInsertParams,
  body: LiveChatMessage,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveChat/messages",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
    ],
    option.Some(json.to_string(live.live_chat_message_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered. A call to this method has a quota cost of 5 units.
pub type LiveChatMessagesListParams {
  LiveChatMessagesListParams(
    live_chat_id: String,
    part: List(String),
    hl: Option(String),
    max_results: Option(Int),
    page_token: Option(String),
    profile_image_size: Option(Int),
  )
}

pub fn live_chat_messages_list(
  live_chat_id: String,
  part: List(String),
) -> LiveChatMessagesListParams {
  LiveChatMessagesListParams(
    live_chat_id,
    part,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn live_chat_messages_list_add_part(
  params: LiveChatMessagesListParams,
  value: String,
) -> LiveChatMessagesListParams {
  LiveChatMessagesListParams(
    params.live_chat_id,
    list.append(params.part, [value]),
    params.hl,
    params.max_results,
    params.page_token,
    params.profile_image_size,
  )
}

pub fn live_chat_messages_list_with_profile_image_size(
  params: LiveChatMessagesListParams,
  value: Int,
) -> LiveChatMessagesListParams {
  LiveChatMessagesListParams(
    params.live_chat_id,
    params.part,
    params.hl,
    params.max_results,
    params.page_token,
    option.Some(value),
  )
}

pub fn live_chat_messages_list_with_page_token(
  params: LiveChatMessagesListParams,
  value: String,
) -> LiveChatMessagesListParams {
  LiveChatMessagesListParams(
    params.live_chat_id,
    params.part,
    params.hl,
    params.max_results,
    option.Some(value),
    params.profile_image_size,
  )
}

pub fn live_chat_messages_list_with_max_results(
  params: LiveChatMessagesListParams,
  value: Int,
) -> LiveChatMessagesListParams {
  LiveChatMessagesListParams(
    params.live_chat_id,
    params.part,
    params.hl,
    option.Some(value),
    params.page_token,
    params.profile_image_size,
  )
}

pub fn live_chat_messages_list_with_hl(
  params: LiveChatMessagesListParams,
  value: String,
) -> LiveChatMessagesListParams {
  LiveChatMessagesListParams(
    params.live_chat_id,
    params.part,
    option.Some(value),
    params.max_results,
    params.page_token,
    params.profile_image_size,
  )
}

pub fn live_chat_messages_list_request(
  params: LiveChatMessagesListParams,
) -> Request {
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
pub type LiveChatMessagesTransitionParams {
  LiveChatMessagesTransitionParams(
    id: Option(String),
    status: Option(LiveChatMessagesTransitionStatus),
  )
}

pub fn live_chat_messages_transition() -> LiveChatMessagesTransitionParams {
  LiveChatMessagesTransitionParams(option.None, option.None)
}

pub fn live_chat_messages_transition_with_status(
  params: LiveChatMessagesTransitionParams,
  value: LiveChatMessagesTransitionStatus,
) -> LiveChatMessagesTransitionParams {
  LiveChatMessagesTransitionParams(params.id, option.Some(value))
}

pub fn live_chat_messages_transition_with_id(
  params: LiveChatMessagesTransitionParams,
  value: String,
) -> LiveChatMessagesTransitionParams {
  LiveChatMessagesTransitionParams(option.Some(value), params.status)
}

pub fn live_chat_messages_transition_request(
  params: LiveChatMessagesTransitionParams,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/liveChat/messages/transition",
    list.flatten([
      case params.id {
        option.Some(v) -> [#("id", v)]
        option.None -> []
      },
      case params.status {
        option.Some(v) -> [
          #("status", live_chat_messages_transition_status_to_string(v)),
        ]
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

/// Deletes a chat moderator.
pub type LiveChatModeratorsDeleteParams {
  LiveChatModeratorsDeleteParams(id: String)
}

pub fn live_chat_moderators_delete(
  id: String,
) -> LiveChatModeratorsDeleteParams {
  LiveChatModeratorsDeleteParams(id)
}

pub fn live_chat_moderators_delete_request(
  params: LiveChatModeratorsDeleteParams,
) -> Request {
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
pub type LiveChatModeratorsInsertParams {
  LiveChatModeratorsInsertParams(part: List(String))
}

pub fn live_chat_moderators_insert(
  part: List(String),
) -> LiveChatModeratorsInsertParams {
  LiveChatModeratorsInsertParams(part)
}

pub fn live_chat_moderators_insert_add_part(
  params: LiveChatModeratorsInsertParams,
  value: String,
) -> LiveChatModeratorsInsertParams {
  LiveChatModeratorsInsertParams(list.append(params.part, [value]))
}

pub fn live_chat_moderators_insert_request(
  params: LiveChatModeratorsInsertParams,
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
    option.Some(json.to_string(live.live_chat_moderator_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type LiveChatModeratorsListParams {
  LiveChatModeratorsListParams(
    live_chat_id: String,
    part: List(String),
    max_results: Option(Int),
    page_token: Option(String),
  )
}

pub fn live_chat_moderators_list(
  live_chat_id: String,
  part: List(String),
) -> LiveChatModeratorsListParams {
  LiveChatModeratorsListParams(live_chat_id, part, option.None, option.None)
}

pub fn live_chat_moderators_list_add_part(
  params: LiveChatModeratorsListParams,
  value: String,
) -> LiveChatModeratorsListParams {
  LiveChatModeratorsListParams(
    params.live_chat_id,
    list.append(params.part, [value]),
    params.max_results,
    params.page_token,
  )
}

pub fn live_chat_moderators_list_with_page_token(
  params: LiveChatModeratorsListParams,
  value: String,
) -> LiveChatModeratorsListParams {
  LiveChatModeratorsListParams(
    params.live_chat_id,
    params.part,
    params.max_results,
    option.Some(value),
  )
}

pub fn live_chat_moderators_list_with_max_results(
  params: LiveChatModeratorsListParams,
  value: Int,
) -> LiveChatModeratorsListParams {
  LiveChatModeratorsListParams(
    params.live_chat_id,
    params.part,
    option.Some(value),
    params.page_token,
  )
}

pub fn live_chat_moderators_list_request(
  params: LiveChatModeratorsListParams,
) -> Request {
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

/// Deletes an existing stream for the authenticated user.
pub type LiveStreamsDeleteParams {
  LiveStreamsDeleteParams(
    id: String,
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn live_streams_delete(id: String) -> LiveStreamsDeleteParams {
  LiveStreamsDeleteParams(id, option.None, option.None)
}

pub fn live_streams_delete_with_on_behalf_of_content_owner_channel(
  params: LiveStreamsDeleteParams,
  value: String,
) -> LiveStreamsDeleteParams {
  LiveStreamsDeleteParams(
    params.id,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn live_streams_delete_with_on_behalf_of_content_owner(
  params: LiveStreamsDeleteParams,
  value: String,
) -> LiveStreamsDeleteParams {
  LiveStreamsDeleteParams(
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_streams_delete_request(params: LiveStreamsDeleteParams) -> Request {
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
pub type LiveStreamsInsertParams {
  LiveStreamsInsertParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn live_streams_insert(part: List(String)) -> LiveStreamsInsertParams {
  LiveStreamsInsertParams(part, option.None, option.None)
}

pub fn live_streams_insert_add_part(
  params: LiveStreamsInsertParams,
  value: String,
) -> LiveStreamsInsertParams {
  LiveStreamsInsertParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_streams_insert_with_on_behalf_of_content_owner_channel(
  params: LiveStreamsInsertParams,
  value: String,
) -> LiveStreamsInsertParams {
  LiveStreamsInsertParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn live_streams_insert_with_on_behalf_of_content_owner(
  params: LiveStreamsInsertParams,
  value: String,
) -> LiveStreamsInsertParams {
  LiveStreamsInsertParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_streams_insert_request(
  params: LiveStreamsInsertParams,
  body: LiveStream,
) -> Request {
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
    option.Some(json.to_string(live.live_stream_to_json(body))),
  )
}

/// Retrieve the list of streams associated with the given channel. --
pub type LiveStreamsListParams {
  LiveStreamsListParams(
    part: List(String),
    id: Option(List(String)),
    max_results: Option(Int),
    mine: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    page_token: Option(String),
  )
}

pub fn live_streams_list(part: List(String)) -> LiveStreamsListParams {
  LiveStreamsListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn live_streams_list_add_part(
  params: LiveStreamsListParams,
  value: String,
) -> LiveStreamsListParams {
  LiveStreamsListParams(
    list.append(params.part, [value]),
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn live_streams_list_with_page_token(
  params: LiveStreamsListParams,
  value: String,
) -> LiveStreamsListParams {
  LiveStreamsListParams(
    params.part,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn live_streams_list_with_on_behalf_of_content_owner_channel(
  params: LiveStreamsListParams,
  value: String,
) -> LiveStreamsListParams {
  LiveStreamsListParams(
    params.part,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.page_token,
  )
}

pub fn live_streams_list_with_on_behalf_of_content_owner(
  params: LiveStreamsListParams,
  value: String,
) -> LiveStreamsListParams {
  LiveStreamsListParams(
    params.part,
    params.id,
    params.max_results,
    params.mine,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn live_streams_list_with_mine(
  params: LiveStreamsListParams,
  value: Bool,
) -> LiveStreamsListParams {
  LiveStreamsListParams(
    params.part,
    params.id,
    params.max_results,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn live_streams_list_with_max_results(
  params: LiveStreamsListParams,
  value: Int,
) -> LiveStreamsListParams {
  LiveStreamsListParams(
    params.part,
    params.id,
    option.Some(value),
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn live_streams_list_with_id(
  params: LiveStreamsListParams,
  value: List(String),
) -> LiveStreamsListParams {
  LiveStreamsListParams(
    params.part,
    option.Some(value),
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn live_streams_list_add_id(
  params: LiveStreamsListParams,
  value: String,
) -> LiveStreamsListParams {
  LiveStreamsListParams(
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

pub fn live_streams_list_request(params: LiveStreamsListParams) -> Request {
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
pub type LiveStreamsUpdateParams {
  LiveStreamsUpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn live_streams_update(part: List(String)) -> LiveStreamsUpdateParams {
  LiveStreamsUpdateParams(part, option.None, option.None)
}

pub fn live_streams_update_add_part(
  params: LiveStreamsUpdateParams,
  value: String,
) -> LiveStreamsUpdateParams {
  LiveStreamsUpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_streams_update_with_on_behalf_of_content_owner_channel(
  params: LiveStreamsUpdateParams,
  value: String,
) -> LiveStreamsUpdateParams {
  LiveStreamsUpdateParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn live_streams_update_with_on_behalf_of_content_owner(
  params: LiveStreamsUpdateParams,
  value: String,
) -> LiveStreamsUpdateParams {
  LiveStreamsUpdateParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn live_streams_update_request(
  params: LiveStreamsUpdateParams,
  body: LiveStream,
) -> Request {
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
    option.Some(json.to_string(live.live_stream_to_json(body))),
  )
}

/// Allows a user to load live chat through a server-streamed RPC. A call to this method has a quota cost of 5 units.
pub type YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    hl: Option(String),
    live_chat_id: Option(String),
    max_results: Option(Int),
    page_token: Option(String),
    part: Option(List(String)),
    profile_image_size: Option(Int),
  )
}

pub fn youtube_v3_live_chat_messages_stream() -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn youtube_v3_live_chat_messages_stream_with_profile_image_size(
  params: YoutubeV3LiveChatMessagesStreamParams,
  value: Int,
) -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    params.hl,
    params.live_chat_id,
    params.max_results,
    params.page_token,
    params.part,
    option.Some(value),
  )
}

pub fn youtube_v3_live_chat_messages_stream_with_part(
  params: YoutubeV3LiveChatMessagesStreamParams,
  value: List(String),
) -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    params.hl,
    params.live_chat_id,
    params.max_results,
    params.page_token,
    option.Some(value),
    params.profile_image_size,
  )
}

pub fn youtube_v3_live_chat_messages_stream_add_part(
  params: YoutubeV3LiveChatMessagesStreamParams,
  value: String,
) -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    params.hl,
    params.live_chat_id,
    params.max_results,
    params.page_token,
    case params.part {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.profile_image_size,
  )
}

pub fn youtube_v3_live_chat_messages_stream_with_page_token(
  params: YoutubeV3LiveChatMessagesStreamParams,
  value: String,
) -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    params.hl,
    params.live_chat_id,
    params.max_results,
    option.Some(value),
    params.part,
    params.profile_image_size,
  )
}

pub fn youtube_v3_live_chat_messages_stream_with_max_results(
  params: YoutubeV3LiveChatMessagesStreamParams,
  value: Int,
) -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    params.hl,
    params.live_chat_id,
    option.Some(value),
    params.page_token,
    params.part,
    params.profile_image_size,
  )
}

pub fn youtube_v3_live_chat_messages_stream_with_live_chat_id(
  params: YoutubeV3LiveChatMessagesStreamParams,
  value: String,
) -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    params.hl,
    option.Some(value),
    params.max_results,
    params.page_token,
    params.part,
    params.profile_image_size,
  )
}

pub fn youtube_v3_live_chat_messages_stream_with_hl(
  params: YoutubeV3LiveChatMessagesStreamParams,
  value: String,
) -> YoutubeV3LiveChatMessagesStreamParams {
  YoutubeV3LiveChatMessagesStreamParams(
    option.Some(value),
    params.live_chat_id,
    params.max_results,
    params.page_token,
    params.part,
    params.profile_image_size,
  )
}

pub fn youtube_v3_live_chat_messages_stream_request(
  params: YoutubeV3LiveChatMessagesStreamParams,
) -> Request {
  Request(
    http.Get,
    "youtube/v3/liveChat/messages/stream",
    list.flatten([
      case params.hl {
        option.Some(v) -> [#("hl", v)]
        option.None -> []
      },
      case params.live_chat_id {
        option.Some(v) -> [#("liveChatId", v)]
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
      case params.part {
        option.Some(v) -> list.map(v, fn(w) { #("part", w) })
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

/// Return broadcasts with a certain status, e.g. active broadcasts.
pub type LiveBroadcastsListBroadcastStatus {
  LiveBroadcastsListBroadcastStatusBroadcastStatusFilterUnspecified
  LiveBroadcastsListBroadcastStatusAll
  LiveBroadcastsListBroadcastStatusActive
  LiveBroadcastsListBroadcastStatusUpcoming
  LiveBroadcastsListBroadcastStatusCompleted
}

pub fn live_broadcasts_list_broadcast_status_to_string(
  value: LiveBroadcastsListBroadcastStatus,
) -> String {
  case value {
    LiveBroadcastsListBroadcastStatusBroadcastStatusFilterUnspecified ->
      "broadcastStatusFilterUnspecified"
    LiveBroadcastsListBroadcastStatusAll -> "all"
    LiveBroadcastsListBroadcastStatusActive -> "active"
    LiveBroadcastsListBroadcastStatusUpcoming -> "upcoming"
    LiveBroadcastsListBroadcastStatusCompleted -> "completed"
  }
}

pub fn live_broadcasts_list_broadcast_status_decoder() -> Decoder(
  LiveBroadcastsListBroadcastStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "broadcastStatusFilterUnspecified" ->
      decode.success(
        LiveBroadcastsListBroadcastStatusBroadcastStatusFilterUnspecified,
      )
    "all" -> decode.success(LiveBroadcastsListBroadcastStatusAll)
    "active" -> decode.success(LiveBroadcastsListBroadcastStatusActive)
    "upcoming" -> decode.success(LiveBroadcastsListBroadcastStatusUpcoming)
    "completed" -> decode.success(LiveBroadcastsListBroadcastStatusCompleted)
    _ ->
      decode.failure(
        LiveBroadcastsListBroadcastStatusBroadcastStatusFilterUnspecified,
        "a valid LiveBroadcastsListBroadcastStatus",
      )
  }
}

/// Return only broadcasts with the selected type.
pub type LiveBroadcastsListBroadcastType {
  LiveBroadcastsListBroadcastTypeBroadcastTypeFilterUnspecified
  LiveBroadcastsListBroadcastTypeAll
  LiveBroadcastsListBroadcastTypeEvent
  LiveBroadcastsListBroadcastTypePersistent
}

pub fn live_broadcasts_list_broadcast_type_to_string(
  value: LiveBroadcastsListBroadcastType,
) -> String {
  case value {
    LiveBroadcastsListBroadcastTypeBroadcastTypeFilterUnspecified ->
      "broadcastTypeFilterUnspecified"
    LiveBroadcastsListBroadcastTypeAll -> "all"
    LiveBroadcastsListBroadcastTypeEvent -> "event"
    LiveBroadcastsListBroadcastTypePersistent -> "persistent"
  }
}

pub fn live_broadcasts_list_broadcast_type_decoder() -> Decoder(
  LiveBroadcastsListBroadcastType,
) {
  use value <- decode.then(decode.string)
  case value {
    "broadcastTypeFilterUnspecified" ->
      decode.success(
        LiveBroadcastsListBroadcastTypeBroadcastTypeFilterUnspecified,
      )
    "all" -> decode.success(LiveBroadcastsListBroadcastTypeAll)
    "event" -> decode.success(LiveBroadcastsListBroadcastTypeEvent)
    "persistent" -> decode.success(LiveBroadcastsListBroadcastTypePersistent)
    _ ->
      decode.failure(
        LiveBroadcastsListBroadcastTypeBroadcastTypeFilterUnspecified,
        "a valid LiveBroadcastsListBroadcastType",
      )
  }
}

/// The status to which the broadcast is going to transition.
pub type LiveBroadcastsTransitionBroadcastStatus {
  LiveBroadcastsTransitionBroadcastStatusStatusUnspecified
  LiveBroadcastsTransitionBroadcastStatusTesting
  LiveBroadcastsTransitionBroadcastStatusLive
  LiveBroadcastsTransitionBroadcastStatusComplete
}

pub fn live_broadcasts_transition_broadcast_status_to_string(
  value: LiveBroadcastsTransitionBroadcastStatus,
) -> String {
  case value {
    LiveBroadcastsTransitionBroadcastStatusStatusUnspecified ->
      "statusUnspecified"
    LiveBroadcastsTransitionBroadcastStatusTesting -> "testing"
    LiveBroadcastsTransitionBroadcastStatusLive -> "live"
    LiveBroadcastsTransitionBroadcastStatusComplete -> "complete"
  }
}

pub fn live_broadcasts_transition_broadcast_status_decoder() -> Decoder(
  LiveBroadcastsTransitionBroadcastStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "statusUnspecified" ->
      decode.success(LiveBroadcastsTransitionBroadcastStatusStatusUnspecified)
    "testing" -> decode.success(LiveBroadcastsTransitionBroadcastStatusTesting)
    "live" -> decode.success(LiveBroadcastsTransitionBroadcastStatusLive)
    "complete" ->
      decode.success(LiveBroadcastsTransitionBroadcastStatusComplete)
    _ ->
      decode.failure(
        LiveBroadcastsTransitionBroadcastStatusStatusUnspecified,
        "a valid LiveBroadcastsTransitionBroadcastStatus",
      )
  }
}

/// The status to which the chat event is going to transition.
pub type LiveChatMessagesTransitionStatus {
  LiveChatMessagesTransitionStatusStatusUnspecified
  LiveChatMessagesTransitionStatusClosed
}

pub fn live_chat_messages_transition_status_to_string(
  value: LiveChatMessagesTransitionStatus,
) -> String {
  case value {
    LiveChatMessagesTransitionStatusStatusUnspecified -> "statusUnspecified"
    LiveChatMessagesTransitionStatusClosed -> "closed"
  }
}

pub fn live_chat_messages_transition_status_decoder() -> Decoder(
  LiveChatMessagesTransitionStatus,
) {
  use value <- decode.then(decode.string)
  case value {
    "statusUnspecified" ->
      decode.success(LiveChatMessagesTransitionStatusStatusUnspecified)
    "closed" -> decode.success(LiveChatMessagesTransitionStatusClosed)
    _ ->
      decode.failure(
        LiveChatMessagesTransitionStatusStatusUnspecified,
        "a valid LiveChatMessagesTransitionStatus",
      )
  }
}
