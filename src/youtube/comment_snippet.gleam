//// DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`

import gleam/option
import youtube/comment_snippet_author_channel_id.{
  type CommentSnippetAuthorChannelId,
}

/// Basic details about a comment, such as its author and text.
pub type CommentSnippet {
  CommentSnippet(
    author_channel_id: option.Option(CommentSnippetAuthorChannelId),
    author_channel_url: option.Option(String),
    author_display_name: option.Option(String),
    author_profile_image_url: option.Option(String),
    can_rate: option.Option(Bool),
    channel_id: option.Option(String),
    image_url: option.Option(String),
    like_count: option.Option(Int),
    moderation_status: option.Option(String),
    parent_id: option.Option(String),
    published_at: option.Option(String),
    text_display: option.Option(String),
    text_original: option.Option(String),
    updated_at: option.Option(String),
    video_id: option.Option(String),
    viewer_rating: option.Option(String),
  )
}
