//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/http
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/third.{type ThirdPartyLink}

/// Deletes a resource.
pub type DeleteParams {
  DeleteParams(
    linking_token: String,
    type_: DeleteType,
    external_channel_id: Option(String),
    part: Option(List(String)),
  )
}

pub fn delete(linking_token: String, type_: DeleteType) -> DeleteParams {
  DeleteParams(linking_token, type_, option.None, option.None)
}

pub fn delete_with_part(params: DeleteParams, value: List(String)) -> DeleteParams {
  DeleteParams(
    params.linking_token,
    params.type_,
    params.external_channel_id,
    option.Some(value),
  )
}

pub fn delete_add_part(params: DeleteParams, value: String) -> DeleteParams {
  DeleteParams(
    params.linking_token,
    params.type_,
    params.external_channel_id,
    case params.part
    {
      option.Some(vs) -> option.Some(list.append(vs, [value]))
      option.None -> option.Some([value])
    },
  )
}

pub fn delete_with_external_channel_id(params: DeleteParams, value: String) -> DeleteParams {
  DeleteParams(
    params.linking_token,
    params.type_,
    option.Some(value),
    params.part,
  )
}

pub fn delete_request(params: DeleteParams) -> Request {
  Request(
    http.Delete,
    "youtube/v3/thirdPartyLinks",
    list.flatten(
      [
        [#("linkingToken", params.linking_token)],
        [#("type", delete_type_to_string(params.type_))],
        case params.external_channel_id
        {
          option.Some(v) -> [#("externalChannelId", v)]
          option.None -> []
        },
        case params.part
        {
          option.Some(v) -> list.map(v, fn(w) { #("part", w) })
          option.None -> []
        },
      ],
    ),
    [],
    [],
    option.None,
  )
}

/// Inserts a new resource into this collection.
pub type InsertParams {
  InsertParams(part: List(String), external_channel_id: Option(String))
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part, option.None)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(list.append(params.part, [value]), params.external_channel_id)
}

pub fn insert_with_external_channel_id(params: InsertParams, value: String) -> InsertParams {
  InsertParams(params.part, option.Some(value))
}

pub fn insert_request(params: InsertParams, body: ThirdPartyLink) -> Request {
  Request(
    http.Post,
    "youtube/v3/thirdPartyLinks",
    list.flatten(
      [
        list.map(params.part, fn(v) { #("part", v) }),
        case params.external_channel_id
        {
          option.Some(v) -> [#("externalChannelId", v)]
          option.None -> []
        },
      ],
    ),
    [],
    [],
    option.Some(json.to_string(third.third_party_link_to_json(body))),
  )
}

/// Retrieves a list of resources, possibly filtered.
pub type ListParams {
  ListParams(
    part: List(String),
    external_channel_id: Option(String),
    linking_token: Option(String),
    type_: Option(ListType),
  )
}

pub fn list(part: List(String)) -> ListParams {
  ListParams(part, option.None, option.None, option.None)
}

pub fn list_add_part(params: ListParams, value: String) -> ListParams {
  ListParams(
    list.append(params.part, [value]),
    params.external_channel_id,
    params.linking_token,
    params.type_,
  )
}

pub fn list_with_type_(params: ListParams, value: ListType) -> ListParams {
  ListParams(
    params.part,
    params.external_channel_id,
    params.linking_token,
    option.Some(value),
  )
}

pub fn list_with_linking_token(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    params.external_channel_id,
    option.Some(value),
    params.type_,
  )
}

pub fn list_with_external_channel_id(params: ListParams, value: String) -> ListParams {
  ListParams(
    params.part,
    option.Some(value),
    params.linking_token,
    params.type_,
  )
}

pub fn list_request(params: ListParams) -> Request {
  Request(
    http.Get,
    "youtube/v3/thirdPartyLinks",
    list.flatten(
      [
        list.map(params.part, fn(v) { #("part", v) }),
        case params.external_channel_id
        {
          option.Some(v) -> [#("externalChannelId", v)]
          option.None -> []
        },
        case params.linking_token
        {
          option.Some(v) -> [#("linkingToken", v)]
          option.None -> []
        },
        case params.type_
        {
          option.Some(v) -> [#("type", list_type_to_string(v))]
          option.None -> []
        },
      ],
    ),
    [],
    [],
    option.None,
  )
}

/// Updates an existing resource.
pub type UpdateParams {
  UpdateParams(part: List(String), external_channel_id: Option(String))
}

pub fn update(part: List(String)) -> UpdateParams {
  UpdateParams(part, option.None)
}

pub fn update_add_part(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(list.append(params.part, [value]), params.external_channel_id)
}

pub fn update_with_external_channel_id(params: UpdateParams, value: String) -> UpdateParams {
  UpdateParams(params.part, option.Some(value))
}

pub fn update_request(params: UpdateParams, body: ThirdPartyLink) -> Request {
  Request(
    http.Put,
    "youtube/v3/thirdPartyLinks",
    list.flatten(
      [
        list.map(params.part, fn(v) { #("part", v) }),
        case params.external_channel_id
        {
          option.Some(v) -> [#("externalChannelId", v)]
          option.None -> []
        },
      ],
    ),
    [],
    [],
    option.Some(json.to_string(third.third_party_link_to_json(body))),
  )
}

/// Type of the link to be deleted.
pub type DeleteType {
  DeleteTypeLinkUnspecified
  DeleteTypeChannelToStoreLink
  DeleteTypeChannelToAffiliateProgramLink
}

pub fn delete_type_to_string(value: DeleteType) -> String {
  case value {
    DeleteTypeLinkUnspecified -> "linkUnspecified"
    DeleteTypeChannelToStoreLink -> "channelToStoreLink"
    DeleteTypeChannelToAffiliateProgramLink -> "channelToAffiliateProgramLink"
  }
}

pub fn delete_type_decoder() -> Decoder(DeleteType) {
  use value <- decode.then(decode.string)
  case value {
    "linkUnspecified" -> decode.success(DeleteTypeLinkUnspecified)
    "channelToStoreLink" -> decode.success(DeleteTypeChannelToStoreLink)
    "channelToAffiliateProgramLink" -> decode.success(
      DeleteTypeChannelToAffiliateProgramLink,
    )
    _ -> decode.failure(DeleteTypeLinkUnspecified, "a valid DeleteType")
  }
}

/// Get a third party link of the given type.
pub type ListType {
  ListTypeLinkUnspecified
  ListTypeChannelToStoreLink
  ListTypeChannelToAffiliateProgramLink
}

pub fn list_type_to_string(value: ListType) -> String {
  case value {
    ListTypeLinkUnspecified -> "linkUnspecified"
    ListTypeChannelToStoreLink -> "channelToStoreLink"
    ListTypeChannelToAffiliateProgramLink -> "channelToAffiliateProgramLink"
  }
}

pub fn list_type_decoder() -> Decoder(ListType) {
  use value <- decode.then(decode.string)
  case value {
    "linkUnspecified" -> decode.success(ListTypeLinkUnspecified)
    "channelToStoreLink" -> decode.success(ListTypeChannelToStoreLink)
    "channelToAffiliateProgramLink" -> decode.success(
      ListTypeChannelToAffiliateProgramLink,
    )
    _ -> decode.failure(ListTypeLinkUnspecified, "a valid ListType")
  }
}