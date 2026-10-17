//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/activity_content_details.{type ActivityContentDetails}
import google_youtube_api_v3/youtube/activity_snippet.{type ActivitySnippet}

/// An `activity` resource contains information about an action that a particular channel, or user, has taken on YouTube. The actions reported in activity feeds include sharing a video, uploading a video, and so forth. Each `activity` resource identifies the type of action, the channel associated with the action, and the resource(s) associated with the action, such as the video that was rated or uploaded.
pub type Activity {
  Activity(
    content_details: Option(ActivityContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(ActivitySnippet),
  )
}

pub fn decoder() -> Decoder(Activity) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(activity_content_details.decoder()),
  )
  use etag <- decode.optional_field(
    "etag",
    option.None,
    decode.optional(decode.string),
  )
  use id <- decode.optional_field(
    "id",
    option.None,
    decode.optional(decode.string),
  )
  use kind <- decode.optional_field(
    "kind",
    option.None,
    decode.optional(decode.string),
  )
  use snippet <- decode.optional_field(
    "snippet",
    option.None,
    decode.optional(activity_snippet.decoder()),
  )
  decode.success(Activity(content_details, etag, id, kind, snippet))
}

pub fn to_json(value: Activity) -> Json {
  json.object(
    [
      #(
        "contentDetails",
        json.nullable(value.content_details, activity_content_details.to_json),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, activity_snippet.to_json)),
    ],
  )
}