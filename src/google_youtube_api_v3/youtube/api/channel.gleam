import gleam/bool
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/channel.{
  type Channel, type ChannelBannerResource, type ChannelSection,
}

/// Inserts a new resource into this collection.
pub type ChannelBannersInsertParams {
  ChannelBannersInsertParams(
    channel_id: Option(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn channel_banners_insert() -> ChannelBannersInsertParams {
  ChannelBannersInsertParams(option.None, option.None, option.None)
}

pub fn channel_banners_insert_with_on_behalf_of_content_owner_channel(
  params: ChannelBannersInsertParams,
  value: String,
) -> ChannelBannersInsertParams {
  ChannelBannersInsertParams(
    params.channel_id,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn channel_banners_insert_with_on_behalf_of_content_owner(
  params: ChannelBannersInsertParams,
  value: String,
) -> ChannelBannersInsertParams {
  ChannelBannersInsertParams(
    params.channel_id,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn channel_banners_insert_with_channel_id(
  params: ChannelBannersInsertParams,
  value: String,
) -> ChannelBannersInsertParams {
  ChannelBannersInsertParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn channel_banners_insert_request(
  params: ChannelBannersInsertParams,
  body: ChannelBannerResource,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/channelBanners/insert",
    list.flatten([
      case params.channel_id {
        option.Some(v) -> [#("channelId", v)]
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
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.upload",
    ],
    option.Some(json.to_string(channel.channel_banner_resource_to_json(body))),
  )
}

/// Deletes a resource.
pub type ChannelSectionsDeleteParams {
  ChannelSectionsDeleteParams(
    id: String,
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn channel_sections_delete(id: String) -> ChannelSectionsDeleteParams {
  ChannelSectionsDeleteParams(id, option.None)
}

pub fn channel_sections_delete_with_on_behalf_of_content_owner(
  params: ChannelSectionsDeleteParams,
  value: String,
) -> ChannelSectionsDeleteParams {
  ChannelSectionsDeleteParams(params.id, option.Some(value))
}

pub fn channel_sections_delete_request(
  params: ChannelSectionsDeleteParams,
) -> Request {
  Request(
    http.Delete,
    "youtube/v3/channelSections",
    list.flatten([
      [#("id", params.id)],
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
    option.None,
  )
}

/// Inserts a new resource into this collection.
pub type ChannelSectionsInsertParams {
  ChannelSectionsInsertParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn channel_sections_insert(
  part: List(String),
) -> ChannelSectionsInsertParams {
  ChannelSectionsInsertParams(part, option.None, option.None)
}

pub fn channel_sections_insert_add_part(
  params: ChannelSectionsInsertParams,
  value: String,
) -> ChannelSectionsInsertParams {
  ChannelSectionsInsertParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn channel_sections_insert_with_on_behalf_of_content_owner_channel(
  params: ChannelSectionsInsertParams,
  value: String,
) -> ChannelSectionsInsertParams {
  ChannelSectionsInsertParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn channel_sections_insert_with_on_behalf_of_content_owner(
  params: ChannelSectionsInsertParams,
  value: String,
) -> ChannelSectionsInsertParams {
  ChannelSectionsInsertParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn channel_sections_insert_request(
  params: ChannelSectionsInsertParams,
  body: ChannelSection,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/channelSections",
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
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(channel.channel_section_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ChannelSectionsListParams {
  ChannelSectionsListParams(
    part: List(String),
    channel_id: Option(String),
    hl: Option(String),
    id: Option(List(String)),
    mine: Option(Bool),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn channel_sections_list(part: List(String)) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn channel_sections_list_add_part(
  params: ChannelSectionsListParams,
  value: String,
) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    list.append(params.part, [value]),
    params.channel_id,
    params.hl,
    params.id,
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn channel_sections_list_with_on_behalf_of_content_owner(
  params: ChannelSectionsListParams,
  value: String,
) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    params.mine,
    option.Some(value),
  )
}

pub fn channel_sections_list_with_mine(
  params: ChannelSectionsListParams,
  value: Bool,
) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner,
  )
}

pub fn channel_sections_list_with_id(
  params: ChannelSectionsListParams,
  value: List(String),
) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    params.part,
    params.channel_id,
    params.hl,
    option.Some(value),
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn channel_sections_list_add_id(
  params: ChannelSectionsListParams,
  value: String,
) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    params.part,
    params.channel_id,
    params.hl,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn channel_sections_list_with_hl(
  params: ChannelSectionsListParams,
  value: String,
) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    params.part,
    params.channel_id,
    option.Some(value),
    params.id,
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn channel_sections_list_with_channel_id(
  params: ChannelSectionsListParams,
  value: String,
) -> ChannelSectionsListParams {
  ChannelSectionsListParams(
    params.part,
    option.Some(value),
    params.hl,
    params.id,
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn channel_sections_list_request(
  params: ChannelSectionsListParams,
) -> Request {
  Request(
    http.Get,
    "youtube/v3/channelSections",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.channel_id {
        option.Some(v) -> [#("channelId", v)]
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
      case params.mine {
        option.Some(v) -> [#("mine", bool.to_string(v))]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.readonly",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Updates an existing resource.
pub type ChannelSectionsUpdateParams {
  ChannelSectionsUpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn channel_sections_update(
  part: List(String),
) -> ChannelSectionsUpdateParams {
  ChannelSectionsUpdateParams(part, option.None)
}

pub fn channel_sections_update_add_part(
  params: ChannelSectionsUpdateParams,
  value: String,
) -> ChannelSectionsUpdateParams {
  ChannelSectionsUpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn channel_sections_update_with_on_behalf_of_content_owner(
  params: ChannelSectionsUpdateParams,
  value: String,
) -> ChannelSectionsUpdateParams {
  ChannelSectionsUpdateParams(params.part, option.Some(value))
}

pub fn channel_sections_update_request(
  params: ChannelSectionsUpdateParams,
  body: ChannelSection,
) -> Request {
  Request(
    http.Put,
    "youtube/v3/channelSections",
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
    option.Some(json.to_string(channel.channel_section_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list(part: List(String)) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_add_part(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_page_token(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_on_behalf_of_content_owner(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_my_subscribers(
  params: ChannelsListParams,
  value: Bool,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_mine(
  params: ChannelsListParams,
  value: Bool,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_max_results(
  params: ChannelsListParams,
  value: Int,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_managed_by_me(
  params: ChannelsListParams,
  value: Bool,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_id(
  params: ChannelsListParams,
  value: List(String),
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_add_id(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_hl(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_for_username(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_for_handle(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_with_category_id(
  params: ChannelsListParams,
  value: String,
) -> ChannelsListParams {
  ChannelsListParams(
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

pub fn channels_list_request(params: ChannelsListParams) -> Request {
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
pub type ChannelsUpdateParams {
  ChannelsUpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn channels_update(part: List(String)) -> ChannelsUpdateParams {
  ChannelsUpdateParams(part, option.None)
}

pub fn channels_update_add_part(
  params: ChannelsUpdateParams,
  value: String,
) -> ChannelsUpdateParams {
  ChannelsUpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn channels_update_with_on_behalf_of_content_owner(
  params: ChannelsUpdateParams,
  value: String,
) -> ChannelsUpdateParams {
  ChannelsUpdateParams(params.part, option.Some(value))
}

pub fn channels_update_request(
  params: ChannelsUpdateParams,
  body: Channel,
) -> Request {
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
    option.Some(json.to_string(channel.channel_to_json(body))),
  )
}
