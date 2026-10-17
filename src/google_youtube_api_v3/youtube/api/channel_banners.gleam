//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/http
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/channel.{type ChannelBannerResource}

/// Inserts a new resource into this collection.
pub type InsertParams {
  InsertParams(
    channel_id: Option(String),
    on_behalf_of_content_owner: Option(String),
    on_behalf_of_content_owner_channel: Option(String),
  )
}

pub fn insert() -> InsertParams {
  InsertParams(option.None, option.None, option.None)
}

pub fn insert_with_on_behalf_of_content_owner_channel(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.channel_id,
    params.on_behalf_of_content_owner,
    option.Some(value),
  )
}

pub fn insert_with_on_behalf_of_content_owner(
  params: InsertParams,
  value: String,
) -> InsertParams {
  InsertParams(
    params.channel_id,
    option.Some(value),
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn insert_with_channel_id(params: InsertParams, value: String) -> InsertParams {
  InsertParams(
    option.Some(value),
    params.on_behalf_of_content_owner,
    params.on_behalf_of_content_owner_channel,
  )
}

pub fn insert_request(params: InsertParams, body: ChannelBannerResource) -> Request {
  Request(
    http.Post,
    "youtube/v3/channelBanners/insert",
    list.flatten([case params.channel_id {
          option.Some(v) -> [#("channelId", v)]
          option.None -> []
        }, case params.on_behalf_of_content_owner {
          option.Some(v) -> [#("onBehalfOfContentOwner", v)]
          option.None -> []
        }, case params.on_behalf_of_content_owner_channel {
          option.Some(v) -> [#("onBehalfOfContentOwnerChannel", v)]
          option.None -> []
        }]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.upload",
    ],
    option.Some(json.to_string(channel.channel_banner_resource_to_json(body))),
  )
}