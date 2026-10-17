//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/tests.{type TestItem}

/// POST method.
pub type InsertParams {
  InsertParams(
    part: List(String),
    external_channel_id: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn insert(part: List(String)) -> InsertParams {
  InsertParams(part, option.None, option.None)
}

pub fn insert_add_part(params: InsertParams, value: String) -> InsertParams {
  InsertParams(
    list.append(params.part, [value]),
    params.external_channel_id,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn insert_with_on_behalf_of_content_owner_channel(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(params.part, params.external_channel_id, option.Some(value))
}

pub fn insert_with_external_channel_id(params: InsertParams, value: String) -> InsertParams {
  InsertParams(
    params.part,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn insert_request(params: InsertParams, body: TestItem) -> Request {
  Request(
    http.Post,
    "youtube/v3/tests",
    list.flatten(
      [
        list.map(params.part, fn(v) { #("part", v) }),
        case params.external_channel_id
        {
          option.Some(v) -> [#("externalChannelId", v)]
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
    ["https://www.googleapis.com/auth/youtube.readonly"],
    option.Some(json.to_string(tests.test_item_to_json(body))),
  )
}