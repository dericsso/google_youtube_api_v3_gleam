//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/activity_content_details.{type ActivityContentDetails}
import youtube/activity_snippet.{type ActivitySnippet}

/// An `activity` resource contains information about an action that a particular channel, or user, has taken on YouTube. The actions reported in activity feeds include sharing a video, uploading a video, and so forth. Each `activity` resource identifies the type of action, the channel associated with the action, and the resource(s) associated with the action, such as the video that was rated or uploaded.
pub type Activity {
  Activity(
    content_details: option.Option(ActivityContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(ActivitySnippet),
  )
}

pub fn decoder() -> Decoder(Activity) {
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(activity_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(activity_snippet.decoder()),
  )
  success(Activity(content_details, etag, id, kind, snippet))
}