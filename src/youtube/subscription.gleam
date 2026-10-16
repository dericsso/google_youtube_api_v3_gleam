//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/dynamic/decode.{type Decoder, optional_field, optional, string, success}
import gleam/option
import youtube/subscription_content_details.{type SubscriptionContentDetails}
import youtube/subscription_snippet.{type SubscriptionSnippet}
import youtube/subscription_subscriber_snippet.{type SubscriptionSubscriberSnippet}

/// A *subscription* resource contains information about a YouTube user subscription. A subscription notifies a user when new videos are added to a channel or when another user takes one of several actions on YouTube, such as uploading a video, rating a video, or commenting on a video.
pub type Subscription {
  Subscription(
    content_details: option.Option(SubscriptionContentDetails),
    etag: option.Option(String),
    id: option.Option(String),
    kind: option.Option(String),
    snippet: option.Option(SubscriptionSnippet),
    subscriber_snippet: option.Option(SubscriptionSubscriberSnippet),
  )
}

pub fn decoder() -> Decoder(Subscription) {
  use content_details <- optional_field(
    "contentDetails",
    option.None,
    optional(subscription_content_details.decoder()),
  )
  use etag <- optional_field("etag", option.None, optional(string))
  use id <- optional_field("id", option.None, optional(string))
  use kind <- optional_field("kind", option.None, optional(string))
  use snippet <- optional_field(
    "snippet",
    option.None,
    optional(subscription_snippet.decoder()),
  )
  use subscriber_snippet <- optional_field(
    "subscriberSnippet",
    option.None,
    optional(subscription_subscriber_snippet.decoder()),
  )
  success(
    Subscription(content_details, etag, id, kind, snippet, subscriber_snippet),
  )
}