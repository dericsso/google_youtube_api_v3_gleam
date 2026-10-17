//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/playlist_image.{type PlaylistImage}

/// Deletes a resource.
pub type DeleteParams {
  DeleteParams(id: Option(String), on_behalf_of_content_owner: Option(String))
}

pub fn delete() -> DeleteParams {
  DeleteParams(option.None, option.None)
}

pub fn delete_with_on_behalf_of_content_owner(
  params: DeleteParams,
  value: String,
) -> DeleteParams {
  DeleteParams(params.id, option.Some(value))
}

pub fn delete_with_id(params: DeleteParams, value: String) -> DeleteParams {
  DeleteParams(option.Some(value), params.on_behalf_of_content_owner)
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/playlistImages",
    list.flatten([case params.id {
          option.Some(v) -> [#("id", v)]
          option.None -> []
        }, case params.on_behalf_of_content_owner {
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
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    part: Option(List(String)),
  )
}

pub fn insert() -> InsertParams {
  InsertParams(option.None, option.None, option.None)
}

pub fn insert_with_part(params: InsertParams, value: List(String)) -> InsertParams {
  InsertParams(
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    case params.part
    {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn insert_with_on_behalf_of_content_owner_channel(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.part,
  )
}

pub fn insert_with_on_behalf_of_content_owner(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.part,
  )
}

pub fn insert_request(params: InsertParams, body: PlaylistImage) -> Request {
  Request(
    http.Post,
    "youtube/v3/playlistImages",
    list.flatten([case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }, case params.on_behalf_of_content_owner_channel {
          option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
          option.None -> []
        }, case params.part {
          option.Some(v) -> list.map(v, fn(w) { #("part", w) })
          option.None -> []
        }]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(playlist_image.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    max_results: Option(Int),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    page_token: Option(String),
    parent: Option(String),
    part: Option(List(String)),
  )
}

pub fn list() -> ListParams {
  ListParams(
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn list_with_part(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    params.parent,
    option.Some(value),
  )
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    params.parent,
    case params.part
    {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn list_with_parent(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    option.Some(value),
    params.part,
  )
}

pub fn list_with_page_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
    params.parent,
    params.part,
  )
}

pub fn list_with_on_behalf_of_content_owner_channel(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.page_token,
    params.parent,
    params.part,
  )
}

pub fn list_with_on_behalf_of_content_owner(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.max_results,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    params.parent,
    params.part,
  )
}

pub fn list_with_max_results(params: ListParams, value: Int) -> ListParams {
  ListParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    params.parent,
    params.part,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/playlistImages",
    list.flatten([case params.max_results {
          option.Some(v) -> [#("maxResults", int.to_string(v))]
          option.None -> []
        }, case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }, case params.on_behalf_of_content_owner_channel {
          option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
          option.None -> []
        }, case params.page_token {
          option.Some(v) -> [#("pageToken", v)]
          option.None -> []
        }, case params.parent {
          option.Some(v) -> [#("parent", v)]
          option.None -> []
        }, case params.part {
          option.Some(v) -> list.map(v, fn(w) { #("part", w) })
          option.None -> []
        }]),
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
  UpdateParams(
    on_behalf_of_content_owner: Option(String),
    part: Option(List(String)),
  )
}

pub fn update() -> UpdateParams {
  UpdateParams(option.None, option.None)
}

pub fn update_with_part(params: UpdateParams, value: List(String)) -> UpdateParams {
  UpdateParams(params.on_behalf_of_content_owner, option.Some(value))
}

pub fn update_add_part(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(params.on_behalf_of_content_owner, case params.part {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    })
}

pub fn update_with_on_behalf_of_content_owner(
  params: UpdateParams,
  value: String,
) -> UpdateParams {
  UpdateParams(option.Some(value), params.part)
}

pub fn update_request(params: UpdateParams, body: PlaylistImage) -> Request {
  Request(
    http.Put,
    "youtube/v3/playlistImages",
    list.flatten([case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }, case params.part {
          option.Some(v) -> list.map(v, fn(w) { #("part", w) })
          option.None -> []
        }]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(playlist_image.to_json(body))),
  )
}