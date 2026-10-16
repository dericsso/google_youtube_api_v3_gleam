//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// As this is not an insert in a strict sense (it supports uploading/setting of a thumbnail for multiple videos, which doesn't result in creation of a single resource), I use a custom verb here.
pub type SetParams {
  SetParams(video_id: String, on_behalf_of_content_owner: Option(String))
}

pub fn set(video_id: String) -> SetParams {
  SetParams(video_id, option.None)
}

pub fn set_with_on_behalf_of_content_owner(
  params: SetParams,
  value: String,
) -> SetParams {
  SetParams(params.video_id, option.Some(value))
}

pub fn set_request(params: SetParams) -> Request {
  Request(
    request.Post,
    "youtube/v3/thumbnails/set",
    list.flatten([
      [#("videoId", params.video_id)],
      case params.on_behalf_of_content_owner {
        option.Some(v) -> [#("onBehalfOfContentOwner", v)]
        option.None -> []
      },
    ]),
    [],
    [
      "https://www.googleapis.com/auth/youtube",
      "https://www.googleapis.com/auth/youtube.force-ssl",
      "https://www.googleapis.com/auth/youtube.upload",
      "https://www.googleapis.com/auth/youtubepartner",
    ],
    option.None,
  )
}
