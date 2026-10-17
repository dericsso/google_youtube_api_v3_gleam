import gleam/http
import gleam/json
import gleam/list
import gleam/option.{type Option}
import google_youtube_api_v3/request.{type Request, Request}
import google_youtube_api_v3/youtube/invideo.{type InvideoBranding}

/// Allows upload of watermark image and setting it for a channel.
pub type SetParams {
  SetParams(channel_id: String, on_behalf_of_content_owner: Option(String))
}

pub fn set(channel_id: String) -> SetParams {
  SetParams(channel_id, option.None)
}

pub fn set_with_on_behalf_of_content_owner(
  params: SetParams,
  value: String,
) -> SetParams {
  SetParams(params.channel_id, option.Some(value))
}

pub fn set_request(params: SetParams, body: InvideoBranding) -> Request {
  Request(
    http.Post,
    "youtube/v3/watermarks/set",
    list.flatten([
      [#("channelId", params.channel_id)],
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
    option.Some(json.to_string(invideo.invideo_branding_to_json(body))),
  )
}

/// Allows removal of channel watermark.
pub type UnsetParams {
  UnsetParams(channel_id: String, on_behalf_of_content_owner: Option(String))
}

pub fn unset(channel_id: String) -> UnsetParams {
  UnsetParams(channel_id, option.None)
}

pub fn unset_with_on_behalf_of_content_owner(
  params: UnsetParams,
  value: String,
) -> UnsetParams {
  UnsetParams(params.channel_id, option.Some(value))
}

pub fn unset_request(params: UnsetParams) -> Request {
  Request(
    http.Post,
    "youtube/v3/watermarks/unset",
    list.flatten([
      [#("channelId", params.channel_id)],
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
