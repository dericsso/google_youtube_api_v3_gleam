//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

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
