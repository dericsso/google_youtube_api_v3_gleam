//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/http
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/caption.{type Caption}

/// Deletes a resource.
pub type DeleteParams {
  DeleteParams(
    id: String,
    on_behalf_of: Option(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn delete(id: String) -> DeleteParams {
  DeleteParams(id, option.None, option.None)
}

pub fn delete_with_on_behalf_of_content_owner(
  params: DeleteParams,
  value: String,
) -> DeleteParams {
  DeleteParams(params.id, params.on_behalf_of, option.Some(value))
}

pub fn delete_with_on_behalf_of(
  params: DeleteParams,
  value: String,
) -> DeleteParams {
  DeleteParams(params.id, option.Some(value), params.on_behalf_of_content_owner)
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/captions",
    list.flatten([
      [#("id", params.id)],
      case params.on_behalf_of {
        option.Some(v) -> [#("onBehalfOf", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Downloads a caption track.
pub type DownloadParams {
  DownloadParams(
    id: String,
    on_behalf_of: Option(String),
    on_behalf_of_content_owner: Option(String),
    tfmt: Option(String),
    tlang: Option(String),
  )
}

pub fn download(id: String) -> DownloadParams {
  DownloadParams(id, option.None, option.None, option.None, option.None)
}

pub fn download_with_tlang(
  params: DownloadParams,
  value: String,
) -> DownloadParams {
  DownloadParams(
    params.id,
    params.on_behalf_of,
    params.on_behalf_of_content_owner,
    params.tfmt,
    option.Some(value),
  )
}

pub fn download_with_tfmt(
  params: DownloadParams,
  value: String,
) -> DownloadParams {
  DownloadParams(
    params.id,
    params.on_behalf_of,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.tlang,
  )
}

pub fn download_with_on_behalf_of_content_owner(
  params: DownloadParams,
  value: String,
) -> DownloadParams {
  DownloadParams(
    params.id,
    params.on_behalf_of,
    option.Some(value),
    params.tfmt,
    params.tlang,
  )
}

pub fn download_with_on_behalf_of(
  params: DownloadParams,
  value: String,
) -> DownloadParams {
  DownloadParams(
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.tfmt,
    params.tlang,
  )
}

pub fn download_request(params: DownloadParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/captions/" <> params.id,
    list.flatten([
      [#("id", params.id)],
      case params.on_behalf_of {
        option.Some(v) -> [#("onBehalfOf", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.tfmt {
        option.Some(v) -> [#("tfmt", v)]
        option.None -> []
      },
      case params.tlang {
        option.Some(v) -> [#("tlang", v)]
        option.None -> []
      },
    ]),
    [],
    [
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
    on_behalf_of: Option(String),
    on_behalf_of_content_owner: Option(String),
    sync: Option(Bool),
  )
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part, option.None, option.None, option.None)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(
    list.append(params.part, [value]),
    params.on_behalf_of,
    params.on_behalf_of_content_owner,
    params.sync,
  )
}

pub fn insert_with_sync(params: InsertParams, value: Bool) -> InsertParams {
  InsertParams(
    params.part,
    params.on_behalf_of,
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
    params.on_behalf_of,
    option.Some(value),
    params.sync,
  )
}

pub fn insert_with_on_behalf_of(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.sync,
  )
}

pub fn insert_request(params: InsertParams, body: Caption) -> Request {
  Request(
    http.Post,
    "youtube/v3/captions",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.on_behalf_of {
        option.Some(v) -> [#("onBehalfOf", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.sync {
        option.Some(v) -> [#("sync", bool.to_string(v))]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(caption.to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    video_id: String,
    id: Option(List(String)),
    on_behalf_of: Option(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn list(part: List(String), video_id: String) -> ListParams {
  ListParams(part, video_id, option.None, option.None, option.None)
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.video_id,
    params.id,
    params.on_behalf_of,
    params.on_behalf_of_content_owner,
  )
}

pub fn list_with_on_behalf_of_content_owner(
  params: ListParams,
  value: String,
) -> ListParams {
  ListParams(
    params.part,
    params.video_id,
    params.id,
    params.on_behalf_of,
    option.Some(value),
  )
}

pub fn list_with_on_behalf_of(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.video_id,
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner,
  )
}

pub fn list_with_id(params: ListParams, value: List(String)) -> ListParams {
  ListParams(
    params.part,
    params.video_id,
    option.Some(value),
    params.on_behalf_of,
    params.on_behalf_of_content_owner,
  )
}

pub fn list_add_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.video_id,
    case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
    params.on_behalf_of,
    params.on_behalf_of_content_owner,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/captions",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      [#("videoId", params.video_id)],
      case params.id {
        option.Some(v) -> list.map(v, fn(w) { #("id", w) })
        option.None -> []
      },
      case params.on_behalf_of {
        option.Some(v) -> [#("onBehalfOf", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}

/// Updates an existing resource.
pub type UpdateParams {
  UpdateParams(
    part: List(String),
    on_behalf_of: Option(String),
    on_behalf_of_content_owner: Option(String),
    sync: Option(Bool),
  )
}

pub fn update(part: List(String)) -> UpdateParams {
  UpdateParams(part, option.None, option.None, option.None)
}

pub fn update_add_part(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of,
    params.on_behalf_of_content_owner,
    params.sync,
  )
}

pub fn update_with_sync(params: UpdateParams, value: Bool) -> UpdateParams {
  UpdateParams(
    params.part,
    params.on_behalf_of,
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
    params.on_behalf_of,
    option.Some(value),
    params.sync,
  )
}

pub fn update_with_on_behalf_of(
  params: UpdateParams,
  value: String,
) -> UpdateParams {
  UpdateParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.sync,
  )
}

pub fn update_request(params: UpdateParams, body: Caption) -> Request {
  Request(
    http.Put,
    "youtube/v3/captions",
    list.flatten([
      list.map(params.part, fn(v) { #("part", v) }),
      case params.on_behalf_of {
        option.Some(v) -> [#("onBehalfOf", v)]
        option.None -> []
      },
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
      case params.sync {
        option.Some(v) -> [#("sync", bool.to_string(v))]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.Some(json.to_string(caption.to_json(body))),
  )
}
