//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder}
import gleam/json.{type Json}
import gleam/option.{type Option}
import google_youtube_api_v3/youtube/subscription_content_details.{type SubscriptionContentDetails}
import google_youtube_api_v3/youtube/subscription_snippet.{type SubscriptionSnippet}
import google_youtube_api_v3/youtube/subscription_subscriber_snippet.{type SubscriptionSubscriberSnippet}

/// A *subscription* resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.
pub type Subscription {
  Subscription(
    content_details: Option(SubscriptionContentDetails),
    etag: Option(String),
    id: Option(String),
    kind: Option(String),
    snippet: Option(SubscriptionSnippet),
    subscriber_snippet: Option(SubscriptionSubscriberSnippet),
  )
}

pub fn decoder() -> Decoder(Subscription) {
  use content_details <- decode.optional_field(
    "contentDetails",
    option.None,
    decode.optional(subscription_content_details.decoder()),
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
    decode.optional(subscription_snippet.decoder()),
  )
  use subscriber_snippet <- decode.optional_field(
    "subscriberSnippet",
    option.None,
    decode.optional(subscription_subscriber_snippet.decoder()),
  )
  decode.success(
    Subscription(content_details, etag, id, kind, snippet, subscriber_snippet),
  )
}

pub fn to_json(value: Subscription) -> Json {
  json.object(
    [
      #(
        "contentDetails",
        json.nullable(
          value.content_details,
          subscription_content_details.to_json,
        ),
      ),
      #("etag", json.nullable(value.etag, json.string)),
      #("id", json.nullable(value.id, json.string)),
      #("kind", json.nullable(value.kind, json.string)),
      #("snippet", json.nullable(value.snippet, subscription_snippet.to_json)),
      #(
        "subscriberSnippet",
        json.nullable(
          value.subscriber_snippet,
          subscription_subscriber_snippet.to_json,
        ),
      ),
    ],
  )
}