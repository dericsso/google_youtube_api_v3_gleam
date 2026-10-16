//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}

/// Returns the trainability status of a video.
pub type GetParams {
  GetParams(id: Option(String))
}

pub fn get() -> GetParams {
  GetParams(option.None)
}

pub fn get_with_id(_params: GetParams, value: String) -> GetParams {
  GetParams(option.Some(value))
}

pub fn get_request(params: GetParams) -> Request {
  Request(
    request.Get,
    "youtube/v3/videoTrainability",
    list.flatten([
      case params.id {
        option.Some(v) -> [#("id", v)]
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
