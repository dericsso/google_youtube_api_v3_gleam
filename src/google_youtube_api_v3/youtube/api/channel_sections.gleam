//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/http
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/channel.{type ChannelSection}

/// Deletes a resource.
pub type DeleteParams {
  DeleteParams(id: String, on_behalf_of_content_owner: Option(String))
}

pub fn delete(id: String) -> DeleteParams {
  DeleteParams(id, option.None)
}

pub fn delete_with_on_behalf_of_content_owner(
  params: DeleteParams,
  value: String,
) -> DeleteParams {
  DeleteParams(params.id, option.Some(value))
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/channelSections",
    list.flatten([[#("id", params.id)], case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }]),
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

pub fn insert_request(params: InsertParams, body: ChannelSection) -> Request {
  Request(
    http.Post,
    "youtube/v3/channelSections",
    list.flatten(
      [
        list.map(params.part, fn(v) { #("part", v) }),
        case params.on_behalf_of_content_owner
        {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        },
        case params.on_behalf_of_content_owner_channel
        {
          option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
          option.None -> []
        },
      ],
    ),
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
pub type ListParams {
  ListParams(
    part: List(String),
    channel_id: Option(String),
    hl: Option(String),
    id: Option(List(String)),
    mine: Option(Bool),
    on_behalf_of_content_owner: Option(String),
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
    params.channel_id,
    params.hl,
    params.id,
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn list_with_on_behalf_of_content_owner(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    params.mine,
    option.Some(value),
  )
}

pub fn list_with_mine(params: ListParams, value: Bool) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner,
  )
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    params.hl,
    option.Some(value),
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(params.part, params.channel_id, params.hl, case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    }, params.mine, params.on_behalf_of_content_owner)
}

pub fn list_with_hl(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.channel_id,
    option.Some(value),
    params.id,
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn list_with_channel_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.hl,
    params.id,
    params.mine,
    params.on_behalf_of_content_owner,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/channelSections",
    list.flatten(
      [list.map(params.part, fn(v) { #("part", v) }), case params.channel_id {
          option.Some(v) -> [#("channelId", v)]
          option.None -> []
        }, case params.hl {
          option.Some(v) -> [#("hl", v)]
          option.None -> []
        }, case params.id {
          option.Some(v) -> list.map(v, fn(w) { #("id", w) })
          option.None -> []
        }, case params.mine {
          option.Some(v) -> [#("mine", bool.to_string(v))]
          option.None -> []
        }, case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }],
    ),
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

pub fn update_request(params: UpdateParams, body: ChannelSection) -> Request {
  Request(
    http.Put,
    "youtube/v3/channelSections",
    list.flatten(
      [
        list.map(params.part, fn(v) { #("part", v) }),
        case params.on_behalf_of_content_owner
        {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        },
      ],
    ),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(channel.channel_section_to_json(body))),
  )
}