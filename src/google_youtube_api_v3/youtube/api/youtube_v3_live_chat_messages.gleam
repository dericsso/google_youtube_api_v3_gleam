//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/int
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Allows a user to load live chat through a server-streamed RPC. A call to this method has a quota cost of 5 units.
pub type StreamParams {
  StreamParams(
    hl: Option(String),
    live_chat_id: Option(String),
    max_results: Option(Int),
    page_token: Option(String),
    part: Option(List(String)),
    profile_image_size: Option(Int),
  )
}

pub fn stream() -> StreamParams {
  StreamParams(
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn stream_with_profile_image_size(
  params: StreamParams,
  value: Int,
) -> StreamParams {
  StreamParams(
    params.hl,
    params.live_chat_id,
    params.max_results,
    params.page_token,
    params.part,
    option.Some(value),
  )
}

pub fn stream_with_part(
  params: StreamParams,
  value: List(String),
) -> StreamParams {
  StreamParams(
    params.hl,
    params.live_chat_id,
    params.max_results,
    params.page_token,
    option.Some(value),
    params.profile_image_size,
  )
}

pub fn stream_add_part(params: StreamParams, value: String) -> StreamParams {
  StreamParams(
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

pub fn stream_with_page_token(
  params: StreamParams,
  value: String,
) -> StreamParams {
  StreamParams(
    params.hl,
    params.live_chat_id,
    params.max_results,
    option.Some(value),
    params.part,
    params.profile_image_size,
  )
}

pub fn stream_with_max_results(
  params: StreamParams,
  value: Int,
) -> StreamParams {
  StreamParams(
    params.hl,
    params.live_chat_id,
    option.Some(value),
    params.page_token,
    params.part,
    params.profile_image_size,
  )
}

pub fn stream_with_live_chat_id(
  params: StreamParams,
  value: String,
) -> StreamParams {
  StreamParams(
    params.hl,
    option.Some(value),
    params.max_results,
    params.page_token,
    params.part,
    params.profile_image_size,
  )
}

pub fn stream_with_hl(params: StreamParams, value: String) -> StreamParams {
  StreamParams(
    option.Some(value),
    params.live_chat_id,
    params.max_results,
    params.page_token,
    params.part,
    params.profile_image_size,
  )
}

pub fn stream_request(params: StreamParams) -> Request {
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
