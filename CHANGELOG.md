# Changelog

All notable changes to `google_youtube_api_v3` are documented here.

## [2.0.0] - 2026-10-17

### Breaking changes

- Changed schema generation from one module per discovery schema to grouped
  domain modules. Schemas with the same name prefix are now emitted together
  based on that prefix, so related `Video*` schemas live in `youtube/video`,
  `Playlist*` schemas live in `youtube/playlist`, and `Channel*` schemas live
  in `youtube/channel`.
- Merged generated request-builder modules by resource-family name as well,
  so operations that were previously split across schema/resource-specific
  files now share a semantic API module.
- Existing imports that reference the previous generated module paths must be
  updated. For example:

  ```gleam
  // Before: one generated module per schema/resource
  import google_youtube_api_v3/youtube/video_list_response
  import google_youtube_api_v3/youtube/api/videos

  // After: related schemas/resources are merged by name
  import google_youtube_api_v3/youtube/video
  import google_youtube_api_v3/youtube/api/video
  ```

- Generated schema types and helper functions now belong to the module for
  their name-based domain. For example, a video response decoder changes from:

  ```gleam
  // Before
  video_list_response.video_list_response_decoder()

  // After
  video.video_list_response_decoder()
  ```

- Request-builder modules now group related resources by their resource name.
  For example, playlist operations that were generated into separate
  `playlists` and `playlist_items` modules are merged into `playlist`:

  ```gleam
  // Before: two imports for related resource operations
  import google_youtube_api_v3/youtube/api/playlists as playlists_api
  import google_youtube_api_v3/youtube/api/playlist_items as items_api

  playlists_api.playlists_list([])
  items_api.playlist_items_list([])

  // After: one grouped import
  import google_youtube_api_v3/youtube/api/playlist as playlist_api
  playlist_api.playlists_list([])
  playlist_api.playlist_items_list([])
  ```

- The function names remain descriptive of the original API resource; the
  breaking change is the module containing them. The same migration applies to
  schema helpers:

  ```gleam
  // Before: the schema had its own generated module
  import google_youtube_api_v3/youtube/video_list_response

  video_list_response.video_list_response_decoder()

  // After: the schema is emitted in the grouped `video` module
  import google_youtube_api_v3/youtube/video

  video.video_list_response_decoder()
  ```

- Similar migrations apply to channel, comment, live-stream, search,
  subscription, and other grouped resource modules. Qualified references to
  moved types, decoders, encoders, enum helpers, and request builders must be
  updated accordingly.

### Generator improvements

- Split the development generator into focused modules for:
  - discovery models and JSON decoders,
  - schema and resource naming,
  - request and path generation,
  - generated-expression construction,
  - rendering and filesystem setup.
- Preserved generated decoder, encoder, request-builder, and Sans-IO runtime
  behavior while making the generator easier to maintain.

### Testing

- Updated generator tests to import discovery-domain types from their dedicated
  module.
- Verified the complete test suite: 70 tests passing.
