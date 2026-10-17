import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/int
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Retrieves a list of members that match the request criteria for a channel.
pub type MembersListParams {
  MembersListParams(
    part: List(String),
    filter_by_member_channel_id: Option(String),
    has_access_to_level: Option(String),
    max_results: Option(Int),
    mode: Option(MembersListMode),
    page_token: Option(String),
  )
}

pub fn members_list(part: List(String)) -> MembersListParams {
  MembersListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn members_list_add_part(params: MembersListParams, value: String) -> MembersListParams {
  MembersListParams(
    list.append(params.part, [value]),
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    params.max_results,
    params.mode,
    params.page_token,
  )
}

pub fn members_list_with_page_token(params: MembersListParams, value: String) -> MembersListParams {
  MembersListParams(
    params.part,
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    params.max_results,
    params.mode,
    option.Some(value),
  )
}

pub fn members_list_with_mode(params: MembersListParams, value: MembersListMode) -> MembersListParams {
  MembersListParams(
    params.part,
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    params.max_results,
    option.Some(value),
    params.page_token,
  )
}

pub fn members_list_with_max_results(params: MembersListParams, value: Int) -> MembersListParams {
  MembersListParams(
    params.part,
    params.filter_by_member_channel_id,
    params.has_access_to_level,
    option.Some(value),
    params.mode,
    params.page_token,
  )
}

pub fn members_list_with_has_access_to_level(
  params: MembersListParams,
  value: String,
) -> MembersListParams {
  MembersListParams(
    params.part,
    params.filter_by_member_channel_id,
    option.Some(value),
    params.max_results,
    params.mode,
    params.page_token,
  )
}

pub fn members_list_with_filter_by_member_channel_id(
  params: MembersListParams,
  value: String,
) -> MembersListParams {
  MembersListParams(
    params.part,
    option.Some(value),
    params.has_access_to_level,
    params.max_results,
    params.mode,
    params.page_token,
  )
}

pub fn members_list_request(params: MembersListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/members",
    list.flatten(
      [
        list.map(params.part, fn(v) { #("part", v) }),
        case params.filter_by_member_channel_id
        {
          option.Some(v) -> [#("filterByMemberChannelId", v)]
          option.None -> []
        },
        case params.has_access_to_level
        {
          option.Some(v) -> [#("hasAccessToLevel", v)]
          option.None -> []
        },
        case params.max_results
        {
          option.Some(v) -> [#("maxResults", int.to_string(v))]
          option.None -> []
        },
        case params.mode
        {
          option.Some(v) -> [#("mode", members_list_mode_to_string(v))]
          option.None -> []
        },
        case params.page_token
        {
          option.Some(v) -> [#("pageToken", v)]
          option.None -> []
        },
      ],
    ),
    [],
    ["https://www.googleapis.com/auth/youtube.channel-memberships.creator"],
    option.None,
  )
}

/// Retrieves a list of all pricing levels offered by a creator to the fans.
pub type MembershipsLevelsListParams {
  MembershipsLevelsListParams(part: List(String))
}

pub fn memberships_levels_list(part: List(String)) -> MembershipsLevelsListParams {
  MembershipsLevelsListParams(part)
}

pub fn memberships_levels_list_add_part(
  params: MembershipsLevelsListParams,
  value: String,
) -> MembershipsLevelsListParams {
  MembershipsLevelsListParams(list.append(params.part, [value]))
}

pub fn memberships_levels_list_request(params: MembershipsLevelsListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/membershipsLevels",
    list.flatten([list.map(params.part, fn(v) { #("part", v) })]),
    [],
    ["https://www.googleapis.com/auth/youtube.channel-memberships.creator"],
    option.None,
  )
}

/// Parameter that specifies which channel members to return.
pub type MembersListMode {
  MembersListModeListMembersModeUnknown
  MembersListModeUpdates
  MembersListModeAllCurrent
}

pub fn members_list_mode_to_string(value: MembersListMode) -> String {
  case value {
    MembersListModeListMembersModeUnknown -> "listMembersModeUnknown"
    MembersListModeUpdates -> "updates"
    MembersListModeAllCurrent -> "all_current"
  }
}

pub fn members_list_mode_decoder() -> Decoder(MembersListMode) {
  use value <- decode.then(decode.string)
  case value {
    "listMembersModeUnknown" -> decode.success(
      MembersListModeListMembersModeUnknown,
    )
    "updates" -> decode.success(MembersListModeUpdates)
    "all_current" -> decode.success(MembersListModeAllCurrent)
    _ -> decode.failure(
      MembersListModeListMembersModeUnknown,
      "a valid MembersListMode",
    )
  }
}