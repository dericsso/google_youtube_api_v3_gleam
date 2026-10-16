//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/int
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of members that match the request criteria for a channel.
pub type ListParams {
  ListParams(
    part: List(String),
    filter_by_member_channel_id: Option(String),
    has_access_to_level: Option(String),
    max_results: Option(Int),
    mode: Option(ListMode),
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
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    params.max_results,
    params.mode,
    params.page_token,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    params.max_results,
    params.mode,
    option.Some(value),
  )
}

pub fn list_with_mode(params: ListParams, value: ListMode) -> ListParams {
  ListParams(
    params.part,
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    params.max_results,
    option.Some(value),
    params.page_token,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    params.part,
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    option.Some(value),
    params.mode,
    params.page_token,
  )
}

pub fn list_with_has_access_to_level(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.filter_by_member_channel_id,
    option.Some(value),
    params.max_results,
    params.mode,
    params.page_token,
  )
}

pub fn list_with_filter_by_member_channel_id(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.has_access_to_level,
    params.max_results,
    params.mode,
    params.page_token,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    request.Get,
    "youtube/v3/members",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.filter_by_member_channel_id {
        option.Some(v) -> [#("filterByMemberChannelId", v)]
        option.None -> []
      },
      case params.has_access_to_level {
        option.Some(v) -> [#("hasAccessToLevel", v)]
        option.None -> []
      },
      case params.max_results {
        option.Some(v) -> [#("maxResults", int.to_string(v))]
        option.None -> []
      },
      case params.mode {
        option.Some(v) -> [#("mode", list_mode_to_string(v))]
        option.None -> []
      },
      case params.page_token {
        option.Some(v) -> [#("pageToken", v)]
        option.None -> []
      },
    ]),
    [],
    ["https://www.googleapis.com/auth/youtube.channel-memberships.creator"],
    option.None,
  )
}

/// Parameter that specifies which channel members to return.
pub type ListMode {
  ListModeListMembersModeUnknown
  ListModeUpdates
  ListModeAllCurrent
}

pub fn list_mode_to_string(value: ListMode) -> String {
  case value {
    ListModeListMembersModeUnknown -> "listMembersModeUnknown"
    ListModeUpdates -> "updates"
    ListModeAllCurrent -> "all_current"
  }
}

pub fn list_mode_decoder() -> Decoder(ListMode) {
  use value <- decode.then(decode.string)
  case value {
    "listMembersModeUnknown" -> decode.success(ListModeListMembersModeUnknown)
    "updates" -> decode.success(ListModeUpdates)
    "all_current" -> decode.success(ListModeAllCurrent)
    _ -> decode.failure(ListModeListMembersModeUnknown, "a valid ListMode")
  }
}
