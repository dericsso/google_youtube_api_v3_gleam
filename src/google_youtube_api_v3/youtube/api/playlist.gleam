//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/bool
import gleam/http
import gleam/int
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/playlist.{type PlaylistImage, type PlaylistItem, type Playlist}

/// Deletes a resource.
pub type PlaylistImagesDeleteParams {
  PlaylistImagesDeleteParams(
    id: Option(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn playlist_images_delete() -> PlaylistImagesDeleteParams {
  PlaylistImagesDeleteParams(option.None, option.None)
}

pub fn playlist_images_delete_with_on_behalf_of_content_owner(
  params: PlaylistImagesDeleteParams,
  value: String,
) -> PlaylistImagesDeleteParams {
  PlaylistImagesDeleteParams(params.id, option.Some(value))
}

pub fn playlist_images_delete_with_id(
  params: PlaylistImagesDeleteParams,
  value: String,
) -> PlaylistImagesDeleteParams {
  PlaylistImagesDeleteParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
  )
}

pub fn playlist_images_delete_request(params: PlaylistImagesDeleteParams) -> Request {
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
pub type PlaylistImagesInsertParams {
  PlaylistImagesInsertParams(
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    part: Option(List(String)),
  )
}

pub fn playlist_images_insert() -> PlaylistImagesInsertParams {
  PlaylistImagesInsertParams(option.None, option.None, option.None)
}

pub fn playlist_images_insert_with_part(
  params: PlaylistImagesInsertParams,
  value: List(String),
) -> PlaylistImagesInsertParams {
  PlaylistImagesInsertParams(
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn playlist_images_insert_add_part(
  params: PlaylistImagesInsertParams,
  value: String,
) -> PlaylistImagesInsertParams {
  PlaylistImagesInsertParams(
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    case params.part
    {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn playlist_images_insert_with_on_behalf_of_content_owner_channel(
  params: PlaylistImagesInsertParams,
  value: String,
) -> PlaylistImagesInsertParams {
  PlaylistImagesInsertParams(
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.part,
  )
}

pub fn playlist_images_insert_with_on_behalf_of_content_owner(
  params: PlaylistImagesInsertParams,
  value: String,
) -> PlaylistImagesInsertParams {
  PlaylistImagesInsertParams(
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.part,
  )
}

pub fn playlist_images_insert_request(
  params: PlaylistImagesInsertParams,
  body: PlaylistImage,
) -> Request {
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
    option.Some(json.to_string(playlist.playlist_image_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type PlaylistImagesListParams {
  PlaylistImagesListParams(
    max_results: Option(Int),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    page_token: Option(String),
    parent: Option(String),
    part: Option(List(String)),
  )
}

pub fn playlist_images_list() -> PlaylistImagesListParams {
  PlaylistImagesListParams(
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn playlist_images_list_with_part(
  params: PlaylistImagesListParams,
  value: List(String),
) -> PlaylistImagesListParams {
  PlaylistImagesListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    params.parent,
    option.Some(value),
  )
}

pub fn playlist_images_list_add_part(
  params: PlaylistImagesListParams,
  value: String,
) -> PlaylistImagesListParams {
  PlaylistImagesListParams(
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

pub fn playlist_images_list_with_parent(
  params: PlaylistImagesListParams,
  value: String,
) -> PlaylistImagesListParams {
  PlaylistImagesListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    option.Some(value),
    params.part,
  )
}

pub fn playlist_images_list_with_page_token(
  params: PlaylistImagesListParams,
  value: String,
) -> PlaylistImagesListParams {
  PlaylistImagesListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
    params.parent,
    params.part,
  )
}

pub fn playlist_images_list_with_on_behalf_of_content_owner_channel(
  params: PlaylistImagesListParams,
  value: String,
) -> PlaylistImagesListParams {
  PlaylistImagesListParams(
    params.max_results,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.page_token,
    params.parent,
    params.part,
  )
}

pub fn playlist_images_list_with_on_behalf_of_content_owner(
  params: PlaylistImagesListParams,
  value: String,
) -> PlaylistImagesListParams {
  PlaylistImagesListParams(
    params.max_results,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    params.parent,
    params.part,
  )
}

pub fn playlist_images_list_with_max_results(
  params: PlaylistImagesListParams,
  value: Int,
) -> PlaylistImagesListParams {
  PlaylistImagesListParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
    params.parent,
    params.part,
  )
}

pub fn playlist_images_list_request(params: PlaylistImagesListParams) -> Request {
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
pub type PlaylistImagesUpdateParams {
  PlaylistImagesUpdateParams(
    on_behalf_of_content_owner: Option(String),
    part: Option(List(String)),
  )
}

pub fn playlist_images_update() -> PlaylistImagesUpdateParams {
  PlaylistImagesUpdateParams(option.None, option.None)
}

pub fn playlist_images_update_with_part(
  params: PlaylistImagesUpdateParams,
  value: List(String),
) -> PlaylistImagesUpdateParams {
  PlaylistImagesUpdateParams(
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn playlist_images_update_add_part(
  params: PlaylistImagesUpdateParams,
  value: String,
) -> PlaylistImagesUpdateParams {
  PlaylistImagesUpdateParams(
    params.on_behalf_of_content_owner,
    case params.part
    {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn playlist_images_update_with_on_behalf_of_content_owner(
  params: PlaylistImagesUpdateParams,
  value: String,
) -> PlaylistImagesUpdateParams {
  PlaylistImagesUpdateParams(option.Some(value), params.part)
}

pub fn playlist_images_update_request(
  params: PlaylistImagesUpdateParams,
  body: PlaylistImage,
) -> Request {
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
    option.Some(json.to_string(playlist.playlist_image_to_json(body))),
  )
}

/// Deletes a resource.
pub type PlaylistItemsDeleteParams {
  PlaylistItemsDeleteParams(
    id: String,
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn playlist_items_delete(id: String) -> PlaylistItemsDeleteParams {
  PlaylistItemsDeleteParams(id, option.None)
}

pub fn playlist_items_delete_with_on_behalf_of_content_owner(
  params: PlaylistItemsDeleteParams,
  value: String,
) -> PlaylistItemsDeleteParams {
  PlaylistItemsDeleteParams(params.id, option.Some(value))
}

pub fn playlist_items_delete_request(params: PlaylistItemsDeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/playlistItems",
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
pub type PlaylistItemsInsertParams {
  PlaylistItemsInsertParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn playlist_items_insert(part: List(String)) -> PlaylistItemsInsertParams {
  PlaylistItemsInsertParams(part, option.None)
}

pub fn playlist_items_insert_add_part(
  params: PlaylistItemsInsertParams,
  value: String,
) -> PlaylistItemsInsertParams {
  PlaylistItemsInsertParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn playlist_items_insert_with_on_behalf_of_content_owner(
  params: PlaylistItemsInsertParams,
  value: String,
) -> PlaylistItemsInsertParams {
  PlaylistItemsInsertParams(params.part, option.Some(value))
}

pub fn playlist_items_insert_request(
  params: PlaylistItemsInsertParams,
  body: PlaylistItem,
) -> Request {
  Request(
    http.Post,
    "youtube/v3/playlistItems",
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
    option.Some(json.to_string(playlist.playlist_item_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type PlaylistItemsListParams {
  PlaylistItemsListParams(
    part: List(String),
    id: Option(List(String)),
    max_results: Option(Int),
    on_behalf_of_content_owner: Option(String),
    page_token: Option(String),
    playlist_id: Option(String),
    video_id: Option(String),
  )
}

pub fn playlist_items_list(part: List(String)) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    part,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
    option.None,
  )
}

pub fn playlist_items_list_add_part(
  params: PlaylistItemsListParams,
  value: String,
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    list.append(params.part, [value]),
    params.id,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.playlist_id,
    params.video_id,
  )
}

pub fn playlist_items_list_with_video_id(
  params: PlaylistItemsListParams,
  value: String,
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    params.part,
    params.id,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.playlist_id,
    option.Some(value),
  )
}

pub fn playlist_items_list_with_playlist_id(
  params: PlaylistItemsListParams,
  value: String,
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    params.part,
    params.id,
    params.max_results,
    params.on_behalf_of_content_owner,
    params.page_token,
    option.Some(value),
    params.video_id,
  )
}

pub fn playlist_items_list_with_page_token(
  params: PlaylistItemsListParams,
  value: String,
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    params.part,
    params.id,
    params.max_results,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.playlist_id,
    params.video_id,
  )
}

pub fn playlist_items_list_with_on_behalf_of_content_owner(
  params: PlaylistItemsListParams,
  value: String,
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    params.part,
    params.id,
    params.max_results,
    option.Some(value),
    params.page_token,
    params.playlist_id,
    params.video_id,
  )
}

pub fn playlist_items_list_with_max_results(
  params: PlaylistItemsListParams,
  value: Int,
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    params.part,
    params.id,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.page_token,
    params.playlist_id,
    params.video_id,
  )
}

pub fn playlist_items_list_with_id(
  params: PlaylistItemsListParams,
  value: List(String),
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(
    params.part,
    option.Some(value),
    params.max_results,
    params.on_behalf_of_content_owner,
    params.page_token,
    params.playlist_id,
    params.video_id,
  )
}

pub fn playlist_items_list_add_id(
  params: PlaylistItemsListParams,
  value: String,
) -> PlaylistItemsListParams {
  PlaylistItemsListParams(params.part, case params.id {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    }, params.max_results, params.on_behalf_of_content_owner, params.page_token, params.playlist_id, params.video_id)
}

pub fn playlist_items_list_request(params: PlaylistItemsListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/playlistItems",
    list.flatten(
      [list.map(params.part, fn(v) { #("part", v) }), case params.id {
          option.Some(v) -> list.map(v, fn(w) { #("id", w) })
          option.None -> []
        }, case params.max_results {
          option.Some(v) -> [#("maxResults", int.to_string(v))]
          option.None -> []
        }, case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }, case params.page_token {
          option.Some(v) -> [#("pageToken", v)]
          option.None -> []
        }, case params.playlist_id {
          option.Some(v) -> [#("playlistId", v)]
          option.None -> []
        }, case params.video_id {
          option.Some(v) -> [#("videoId", v)]
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
pub type PlaylistItemsUpdateParams {
  PlaylistItemsUpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn playlist_items_update(part: List(String)) -> PlaylistItemsUpdateParams {
  PlaylistItemsUpdateParams(part, option.None)
}

pub fn playlist_items_update_add_part(
  params: PlaylistItemsUpdateParams,
  value: String,
) -> PlaylistItemsUpdateParams {
  PlaylistItemsUpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn playlist_items_update_with_on_behalf_of_content_owner(
  params: PlaylistItemsUpdateParams,
  value: String,
) -> PlaylistItemsUpdateParams {
  PlaylistItemsUpdateParams(params.part, option.Some(value))
}

pub fn playlist_items_update_request(
  params: PlaylistItemsUpdateParams,
  body: PlaylistItem,
) -> Request {
  Request(
    http.Put,
    "youtube/v3/playlistItems",
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
    option.Some(json.to_string(playlist.playlist_item_to_json(body))),
  )
}

/// Deletes a resource.
pub type PlaylistsDeleteParams {
  PlaylistsDeleteParams(id: String, on_behalf_of_content_owner: Option(String))
}

pub fn playlists_delete(id: String) -> PlaylistsDeleteParams {
  PlaylistsDeleteParams(id, option.None)
}

pub fn playlists_delete_with_on_behalf_of_content_owner(
  params: PlaylistsDeleteParams,
  value: String,
) -> PlaylistsDeleteParams {
  PlaylistsDeleteParams(params.id, option.Some(value))
}

pub fn playlists_delete_request(params: PlaylistsDeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/playlists",
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
pub type PlaylistsInsertParams {
  PlaylistsInsertParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn playlists_insert(part: List(String)) -> PlaylistsInsertParams {
  PlaylistsInsertParams(part, option.None, option.None)
}

pub fn playlists_insert_add_part(params: PlaylistsInsertParams, value: String) -> PlaylistsInsertParams {
  PlaylistsInsertParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn playlists_insert_with_on_behalf_of_content_owner_channel(
  params: PlaylistsInsertParams,
  value: String,
) -> PlaylistsInsertParams {
  PlaylistsInsertParams(
    params.part,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn playlists_insert_with_on_behalf_of_content_owner(
  params: PlaylistsInsertParams,
  value: String,
) -> PlaylistsInsertParams {
  PlaylistsInsertParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn playlists_insert_request(params: PlaylistsInsertParams, body: Playlist) -> Request {
  Request(
    http.Post,
    "youtube/v3/playlists",
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
    option.Some(json.to_string(playlist.playlist_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type PlaylistsListParams {
  PlaylistsListParams(
    part: List(String),
    channel_id: Option(String),
    hl: Option(String),
    id: Option(List(String)),
    max_results: Option(Int),
    mine: Option(Bool),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
    page_token: Option(String),
  )
}

pub fn playlists_list(part: List(String)) -> PlaylistsListParams {
  PlaylistsListParams(
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

pub fn playlists_list_add_part(params: PlaylistsListParams, value: String) -> PlaylistsListParams {
  PlaylistsListParams(
    list.append(params.part, [value]),
    params.channel_id,
    params.hl,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn playlists_list_with_page_token(
  params: PlaylistsListParams,
  value: String,
) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    option.Some(value),
  )
}

pub fn playlists_list_with_on_behalf_of_content_owner_channel(
  params: PlaylistsListParams,
  value: String,
) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    option.Some(value),
    params.page_token,
  )
}

pub fn playlists_list_with_on_behalf_of_content_owner(
  params: PlaylistsListParams,
  value: String,
) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    params.max_results,
    params.mine,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn playlists_list_with_mine(params: PlaylistsListParams, value: Bool) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    params.max_results,
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn playlists_list_with_max_results(params: PlaylistsListParams, value: Int) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    params.hl,
    params.id,
    option.Some(value),
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn playlists_list_with_id(params: PlaylistsListParams, value: List(String)) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    params.hl,
    option.Some(value),
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn playlists_list_add_id(params: PlaylistsListParams, value: String) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    params.hl,
    case params.id
    {
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

pub fn playlists_list_with_hl(params: PlaylistsListParams, value: String) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    params.channel_id,
    option.Some(value),
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn playlists_list_with_channel_id(
  params: PlaylistsListParams,
  value: String,
) -> PlaylistsListParams {
  PlaylistsListParams(
    params.part,
    option.Some(value),
    params.hl,
    params.id,
    params.max_results,
    params.mine,
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
    params.page_token,
  )
}

pub fn playlists_list_request(params: PlaylistsListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/playlists",
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
        }, case params.max_results {
          option.Some(v) -> [#("maxResults", int.to_string(v))]
          option.None -> []
        }, case params.mine {
          option.Some(v) -> [#("mine", bool.to_string(v))]
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
pub type PlaylistsUpdateParams {
  PlaylistsUpdateParams(
    part: List(String),
    on_behalf_of_content_owner: Option(String),
  )
}

pub fn playlists_update(part: List(String)) -> PlaylistsUpdateParams {
  PlaylistsUpdateParams(part, option.None)
}

pub fn playlists_update_add_part(params: PlaylistsUpdateParams, value: String) -> PlaylistsUpdateParams {
  PlaylistsUpdateParams(
    list.append(params.part, [value]),
    params.on_behalf_of_content_owner,
  )
}

pub fn playlists_update_with_on_behalf_of_content_owner(
  params: PlaylistsUpdateParams,
  value: String,
) -> PlaylistsUpdateParams {
  PlaylistsUpdateParams(params.part, option.Some(value))
}

pub fn playlists_update_request(params: PlaylistsUpdateParams, body: Playlist) -> Request {
  Request(
    http.Put,
    "youtube/v3/playlists",
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
    option.Some(json.to_string(playlist.playlist_to_json(body))),
  )
}