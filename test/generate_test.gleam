import generate.{
  type Discovery, type Kind, type Method, type Parameter, type Resource,
  type Schema, Array, Boolean, Delete, Discovery, Get, Integer, Method, Number,
  Object, ParamBoolean, ParamInteger, ParamString, Parameter, Path, Post, Put,
  Query, Ref, Resource, Schema, Str,
}
import gleam/dict
import gleam/http
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/set
import gleam/string
import gleeunit/should
import google_youtube_api_v3/httpc as api_httpc
import google_youtube_api_v3/request as api_request
import simplifile
import youtube/api/captions as captions_api
import youtube/api/playlists as playlists_api
import youtube/api/videos as videos_api
import youtube/page_info
import youtube/playlist
import youtube/playlist_item_status
import youtube/video_snippet
import youtube/video_suggestions

const discovery_file_path = "discovery/2026-10-16_discovery_document.json"

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

fn load_discovery() -> Discovery {
  let assert Ok(content) = simplifile.read(discovery_file_path)
    as "discovery document must be readable"
  let assert Ok(discovery) = generate.parse_discovery(content)
    as "discovery document must parse with the current decoders"
  discovery
}

/// Walk every schema reachable from the top-level map, including nested
/// properties, array items, and additionalProperties.
fn all_schemas(discovery: Discovery) -> List(Schema) {
  discovery.schemas
  |> dict.values
  |> list.flat_map(fn(schema) { [schema, ..descendants(schema)] })
}

fn descendants(schema: Schema) -> List(Schema) {
  case schema.kind {
    Array(items:) -> [items, ..descendants(items)]
    Object(properties:, additional:) -> {
      let from_props = properties |> dict.values |> list.flat_map(descendants)
      let wrapped_props = properties |> dict.values
      let from_additional = case additional {
        Some(extra) -> [extra, ..descendants(extra)]
        None -> []
      }
      list.flatten([wrapped_props, from_props, from_additional])
    }
    Ref(_) | Str(_, _) | Integer(_) | Number | Boolean | generate.Any -> []
  }
}

fn kinds(schemas: List(Schema)) -> List(Kind) {
  list.map(schemas, fn(schema) { schema.kind })
}

// ---------------------------------------------------------------------------
// Full-document regression tests: every construct in the discovery file
// must be accounted for by the decoders, otherwise codegen starts from a
// lossy model.
// ---------------------------------------------------------------------------

pub fn parses_real_discovery_document_test() {
  let assert Ok(content) = simplifile.read(discovery_file_path)
  let result = generate.parse_discovery(content)
  should.be_ok(result)
}

pub fn schema_count_test() {
  let Discovery(schemas:, ..) = load_discovery()
  // Guard against silently decoding an empty/truncated document.
  should.equal(dict.size(schemas), 209)
}

pub fn every_top_level_schema_is_an_object_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let kinds = dict.values(schemas) |> kinds
  let objects = list.filter(kinds, fn(kind) { is_object(kind) })
  // All 209 top-level schemas in this document are type=object.
  should.equal(list.length(objects), 209)
}

fn is_object(kind: Kind) -> Bool {
  case kind {
    Object(_, _) -> True
    _ -> False
  }
}

pub fn all_property_kinds_are_covered_test() {
  let discovery = load_discovery()
  let schemas = all_schemas(discovery)

  let count = fn(predicate: fn(Kind) -> Bool) {
    list.filter(kinds(schemas), predicate) |> list.length
  }

  // Expected tallies derived from the discovery document itself (verified
  // with an independent script counting $ref/type/items/additionalProperties
  // occurrences, including nested array items, additionalProperties schemas,
  // and the 5 string properties nested inside
  // ChannelContentDetails.relatedPlaylists):
  // refs: 205 properties + 41 array items + 4 additionalProperties = 250
  // strings: 670 properties + 28 array items + 5 nested = 703
  should.equal(count(is_ref), 250)
  should.equal(count(is_str), 703)
  should.equal(count(is_integer), 29)
  should.equal(count(is_number), 5)
  should.equal(count(is_boolean), 56)
  should.equal(count(is_array), 69)
  // objects: 209 top-level schemas + 5 object-typed properties
  // (4 localizations maps + relatedPlaylists). Nothing below property level
  // in this document is an object (array items / additionalProperties here
  // are only ever $ref or string).
  should.equal(count(is_object), 214)
}

fn is_ref(kind: Kind) -> Bool {
  case kind {
    Ref(_) -> True
    _ -> False
  }
}

fn is_str(kind: Kind) -> Bool {
  case kind {
    Str(_, _) -> True
    _ -> False
  }
}

fn is_integer(kind: Kind) -> Bool {
  case kind {
    Integer(_) -> True
    _ -> False
  }
}

fn is_number(kind: Kind) -> Bool {
  case kind {
    Number -> True
    _ -> False
  }
}

fn is_boolean(kind: Kind) -> Bool {
  case kind {
    Boolean -> True
    _ -> False
  }
}

fn is_array(kind: Kind) -> Bool {
  case kind {
    Array(_) -> True
    _ -> False
  }
}

pub fn every_ref_target_exists_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let names = dict.keys(schemas) |> set.from_list
  let missing =
    all_schemas(Discovery(schemas:, resources: dict.new()))
    |> kinds
    |> list.filter_map(fn(kind) {
      case kind {
        Ref(name) ->
          case set.contains(names, name) {
            True -> Error(Nil)
            False -> Ok(name)
          }
        _ -> Error(Nil)
      }
    })
  // Codegen cannot resolve dangling $refs.
  should.equal(missing, [])
}

pub fn string_formats_are_all_accounted_for_test() {
  let discovery = load_discovery()
  let formats =
    all_schemas(discovery)
    |> kinds
    |> list.filter_map(fn(kind) {
      case kind {
        Str(Some(format), _) -> Ok(format)
        _ -> Error(Nil)
      }
    })
    |> set.from_list
  // Every string format seen in the document; add new ones here if the
  // discovery file grows a new format. Note uint64/int64 appear on
  // type=string (the API transports 64-bit ints as strings).
  let expected =
    set.from_list([
      "date-time", "byte", "google-datetime", "google-duration", "int64",
      "uint64",
    ])
  should.equal(formats, expected)
}

pub fn integer_formats_are_all_accounted_for_test() {
  let discovery = load_discovery()
  let formats =
    all_schemas(discovery)
    |> kinds
    |> list.filter_map(fn(kind) {
      case kind {
        Integer(Some(format)) -> Ok(format)
        _ -> Error(Nil)
      }
    })
    |> set.from_list
  let expected = set.from_list(["int32", "uint32"])
  should.equal(formats, expected)
}

pub fn number_format_is_double_test() {
  let discovery = load_discovery()
  // All 5 number schemas (aspectRatio, frameRateFps, altitude,
  // longitude, latitude) use format=double. The decoder currently drops
  // the format, so just assert the count to notice if that changes.
  let numbers =
    all_schemas(discovery)
    |> kinds
    |> list.filter(is_number)
  should.equal(list.length(numbers), 5)
}

pub fn string_enums_are_decoded_test() {
  let Discovery(schemas:, ..) = load_discovery()
  // Spot-check a schema known to carry enum + enumDescriptions alongside
  // the type (extra keys the decoder must tolerate, not choke on).
  let assert Ok(status) = dict.get(schemas, "PlaylistItemStatus")
  let assert Object(properties:, ..) = status.kind
  let assert Ok(privacy) = dict.get(properties, "privacyStatus")
  should.equal(privacy.kind, Str(None, ["public", "unlisted", "private"]))
}

pub fn nested_object_properties_are_decoded_test() {
  let Discovery(schemas:, ..) = load_discovery()
  // ChannelContentDetails.relatedPlaylists is the only property in the
  // document that nests a "properties" map inside a property.
  let assert Ok(details) = dict.get(schemas, "ChannelContentDetails")
  let assert Object(properties:, ..) = details.kind
  let assert Ok(related) = dict.get(properties, "relatedPlaylists")
  let assert Object(properties: nested, ..) = related.kind
  nested
  |> dict.keys
  |> list.sort(by: string.compare)
  |> should.equal([
    "favorites",
    "likes",
    "uploads",
    "watchHistory",
    "watchLater",
  ])
}

pub fn additional_properties_are_decoded_test() {
  let Discovery(schemas:, ..) = load_discovery()
  // 4 properties use additionalProperties: $ref (Video/Channel/Playlist/
  // ChannelSection localizations). They live on properties, not on
  // top-level schemas, so walk the whole tree.
  let with_additional =
    all_schemas(Discovery(schemas:, resources: dict.new()))
    |> list.filter(fn(schema) {
      case schema.kind {
        Object(additional: Some(_), ..) -> True
        _ -> False
      }
    })
  should.equal(list.length(with_additional), 4)
  let assert Ok(video) = dict.get(schemas, "Video")
  let assert Object(properties: video_props, ..) = video.kind
  let assert Ok(localizations) = dict.get(video_props, "localizations")
  let assert Object(additional: Some(extra), ..) = localizations.kind
  should.equal(extra.kind, Ref("VideoLocalization"))
}

pub fn empty_object_decodes_test() {
  let Discovery(schemas:, ..) = load_discovery()
  // TokenPagination has no properties at all.
  let assert Ok(token) = dict.get(schemas, "TokenPagination")
  let assert Object(properties:, additional:) = token.kind
  should.equal(dict.size(properties), 0)
  should.equal(additional, None)
}

pub fn array_items_variants_are_decoded_test() {
  let Discovery(schemas:, ..) = load_discovery()
  // Array of inline strings: VideoSnippet.tags.
  let assert Ok(snippet) = dict.get(schemas, "VideoSnippet")
  let assert Object(properties: snippet_props, ..) = snippet.kind
  let assert Ok(tags) = dict.get(snippet_props, "tags")
  let assert Array(items:) = tags.kind
  should.equal(items.kind, Str(None, []))

  // Array of $ref: e.g. SearchListResponse.items -> SearchResult.
  let assert Ok(search) = dict.get(schemas, "SearchListResponse")
  let assert Object(properties: search_props, ..) = search.kind
  let assert Ok(items) = dict.get(search_props, "items")
  let assert Array(items: item_schema) = items.kind
  should.equal(item_schema.kind, Ref("SearchResult"))

  // Array of inline enum strings: VideoSuggestions.processingWarnings.
  let assert Ok(suggestions) = dict.get(schemas, "VideoSuggestions")
  let assert Object(properties: suggestion_props, ..) = suggestions.kind
  let assert Ok(warnings) = dict.get(suggestion_props, "processingWarnings")
  let assert Array(items: warning_item) = warnings.kind
  let assert Str(_, enum) = warning_item.kind
  should.be_true(enum != [])
}

// ---------------------------------------------------------------------------
// Decoder unit tests on inline JSON snippets (one per Kind branch)
// ---------------------------------------------------------------------------

fn parse_schema(raw: String) -> Schema {
  let assert Ok(schema) = json.parse(raw, generate.schema_decoder())
    as "inline schema snippet must decode"
  schema
}

pub fn ref_decoder_test() {
  parse_schema("{\"$ref\": \"VideoSnippet\"}")
  |> should.equal(Schema(None, Ref("VideoSnippet")))
}

pub fn ref_wins_over_type_test() {
  // The document never has both, but the decoder prefers $ref; lock that in.
  parse_schema("{\"$ref\": \"VideoSnippet\", \"type\": \"object\"}")
  |> should.equal(Schema(None, Ref("VideoSnippet")))
}

pub fn string_decoder_test() {
  parse_schema("{\"type\": \"string\"}")
  |> should.equal(Schema(None, Str(None, [])))
}

pub fn string_with_format_and_enum_decoder_test() {
  parse_schema(
    "{\"type\": \"string\", \"format\": \"date-time\", \"enum\": [\"a\", \"b\"], \"enumDescriptions\": [\"x\", \"y\"], \"description\": \"d\"}",
  )
  |> should.equal(Schema(Some("d"), Str(Some("date-time"), ["a", "b"])))
}

pub fn integer_decoder_test() {
  parse_schema("{\"type\": \"integer\", \"format\": \"uint64\"}")
  |> should.equal(Schema(None, Integer(Some("uint64"))))
}

pub fn number_decoder_test() {
  parse_schema("{\"type\": \"number\", \"format\": \"double\"}")
  |> should.equal(Schema(None, Number))
}

pub fn boolean_decoder_test() {
  parse_schema("{\"type\": \"boolean\", \"description\": \"d\"}")
  |> should.equal(Schema(Some("d"), Boolean))
}

pub fn any_decoder_test() {
  parse_schema("{\"type\": \"any\"}")
  |> should.equal(Schema(None, generate.Any))
}

pub fn array_of_ref_decoder_test() {
  let schema =
    parse_schema("{\"type\": \"array\", \"items\": {\"$ref\": \"Comment\"}}")
  should.equal(schema.kind, Array(Schema(None, Ref("Comment"))))
}

pub fn array_of_inline_string_decoder_test() {
  let schema =
    parse_schema("{\"type\": \"array\", \"items\": {\"type\": \"string\"}}")
  should.equal(schema.kind, Array(Schema(None, Str(None, []))))
}

pub fn object_decoder_test() {
  let schema =
    parse_schema(
      "{\"type\": \"object\", \"properties\": {\"title\": {\"type\": \"string\"}}, \"additionalProperties\": {\"$ref\": \"VideoLocalization\"}}",
    )
  let assert Object(properties:, additional:) = schema.kind
  should.equal(dict.size(properties), 1)
  let assert Ok(title) = dict.get(properties, "title")
  should.equal(title.kind, Str(None, []))
  should.equal(additional, Some(Schema(None, Ref("VideoLocalization"))))
}

pub fn unknown_type_fails_test() {
  json.parse("{\"type\": \"null\"}", generate.schema_decoder())
  |> should.be_error
}

pub fn parse_discovery_error_on_bad_json_test() {
  generate.parse_discovery("not json")
  |> should.be_error
}

pub fn description_is_optional_test() {
  // Schemas without a description (e.g. TokenPagination) decode to None.
  parse_schema("{\"type\": \"object\"}")
  |> should.equal(Schema(None, Object(dict.new(), None)))
}

// ---------------------------------------------------------------------------
// Codegen tests: the `type` emitted per file
// ---------------------------------------------------------------------------

pub fn generated_module_carries_do_not_change_header_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let assert Ok(schema) = dict.get(schemas, "Video")
  generate.build_module("Video", schema)
  |> string.starts_with("//// " <> generate.generated_notice)
  |> should.be_true
}

// ---------------------------------------------------------------------------
// Method/resource regression tests
// ---------------------------------------------------------------------------

/// Every method in the tree, including nested resources (e.g. youtube.*).
fn all_methods(discovery: Discovery) -> List(Method) {
  let Discovery(resources:, ..) = discovery
  dict.values(resources) |> list.flat_map(methods_of_resource)
}

fn methods_of_resource(resource: Resource) -> List(Method) {
  let Resource(methods:, nested:) = resource
  list.flatten([
    dict.values(methods),
    dict.values(nested) |> list.flat_map(methods_of_resource),
  ])
}

fn all_parameters(discovery: Discovery) -> List(Parameter) {
  all_methods(discovery)
  |> list.flat_map(fn(method) { dict.values(method.parameters) })
}

pub fn resource_count_test() {
  let Discovery(resources:, ..) = load_discovery()
  // 31 resources with methods plus the nested `youtube` resource tree.
  should.equal(dict.size(resources), 32)
}

pub fn method_count_test() {
  let discovery = load_discovery()
  should.equal(list.length(all_methods(discovery)), 83)
}

pub fn http_method_tallies_test() {
  let methods = all_methods(load_discovery())
  let count = fn(want) {
    list.filter(methods, fn(m) { m.http_method == want }) |> list.length
  }
  should.equal(count(Get), 29)
  should.equal(count(Post), 29)
  should.equal(count(Put), 11)
  should.equal(count(Delete), 14)
}

pub fn videos_list_spot_check_test() {
  let Discovery(resources:, ..) = load_discovery()
  let assert Ok(videos) = dict.get(resources, "videos")
  let assert Ok(list) = dict.get(videos.methods, "list")
  should.equal(list.id, "youtube.videos.list")
  should.equal(list.http_method, Get)
  should.equal(list.response, Some("VideoListResponse"))
  should.equal(list.request, None)
  // The `part` parameter is required and repeatable.
  let assert Ok(part) = dict.get(list.parameters, "part")
  should.equal(part.required, True)
  should.equal(part.repeated, True)
  should.equal(part.location, Query)
  should.equal(part.param_type, ParamString)
  // Enum + format details survive decoding.
  let assert Ok(chart) = dict.get(list.parameters, "chart")
  should.equal(chart.enum, ["chartUnspecified", "mostPopular"])
  let assert Ok(max_results) = dict.get(list.parameters, "maxResults")
  should.equal(max_results.param_type, ParamInteger)
  should.equal(max_results.format, Some("uint32"))
}

pub fn request_and_response_refs_resolve_test() {
  let Discovery(schemas:, resources:) = load_discovery()
  let names = dict.keys(schemas) |> set.from_list
  let missing =
    all_methods(Discovery(schemas:, resources:))
    |> list.flat_map(fn(method) {
      [method.request, method.response] |> option.values
    })
    |> list.filter(fn(name) { !set.contains(names, name) })
  // Codegen cannot resolve dangling request/response $refs.
  should.equal(missing, [])
}

pub fn methods_without_response_are_deletes_and_friends_test() {
  let methods = all_methods(load_discovery())
  let without_response = list.filter(methods, fn(m) { m.response == None })
  // 21 methods return no resource: deletes, rate, captions.download, etc.
  should.equal(list.length(without_response), 21)
  list.any(without_response, fn(m) { m.id == "youtube.captions.download" })
  |> should.be_true
}

pub fn path_parameter_is_decoded_test() {
  let Discovery(resources:, ..) = load_discovery()
  // captions.download.id is the only path parameter in the document.
  let assert Ok(captions) = dict.get(resources, "captions")
  let assert Ok(download) = dict.get(captions.methods, "download")
  let assert Ok(id) = dict.get(download.parameters, "id")
  should.equal(id.location, Path)
  should.equal(id.required, True)
  should.equal(download.supports_media_download, True)
}

pub fn parameter_location_tallies_test() {
  let params = all_parameters(load_discovery())
  let queries = list.filter(params, fn(p) { p.location == Query })
  let paths = list.filter(params, fn(p) { p.location == Path })
  should.equal(list.length(queries), 318)
  should.equal(list.length(paths), 1)
}

pub fn parameter_flag_tallies_test() {
  let params = all_parameters(load_discovery())
  let count = fn(f: fn(Parameter) -> Bool) {
    list.filter(params, f) |> list.length
  }
  should.equal(count(fn(p) { p.required }), 81)
  should.equal(count(fn(p) { p.repeated }), 75)
  should.equal(count(fn(p) { p.enum != [] }), 29)
  should.equal(count(fn(p) { p.param_type == ParamString }), 277)
  should.equal(count(fn(p) { p.param_type == ParamInteger }), 21)
  should.equal(count(fn(p) { p.param_type == ParamBoolean }), 21)
}

pub fn scopes_are_decoded_test() {
  let methods = all_methods(load_discovery())
  let scoped = list.filter(methods, fn(m) { m.scopes != [] })
  // All methods carry scopes except the four thirdPartyLinks ones.
  should.equal(list.length(scoped), 79)
  let assert Ok(list_method) =
    list.find(methods, fn(m) { m.id == "youtube.videos.list" })
  should.be_true(list.contains(
    list_method.scopes,
    "https://www.googleapis.com/auth/youtube.readonly",
  ))
}

pub fn media_upload_is_decoded_test() {
  let methods = all_methods(load_discovery())
  let uploads = list.filter(methods, fn(m) { m.media_upload != None })
  // videos/captions/channelBanners/thumbnails/watermarks/playlistImages.
  should.equal(list.length(uploads), 8)
  let assert Ok(insert) =
    list.find(methods, fn(m) { m.id == "youtube.videos.insert" })
  let assert Some(upload) = insert.media_upload
  should.equal(upload.max_size, Some("274877906944"))
  should.be_true(list.contains(upload.protocols, "resumable"))
}

// ---------------------------------------------------------------------------
// Method/resource decoder unit tests on inline JSON snippets
// ---------------------------------------------------------------------------

fn parse_method(raw: String) -> Method {
  let assert Ok(method) = json.parse(raw, generate.method_decoder())
    as "inline method snippet must decode"
  method
}

fn parse_parameter(raw: String) -> Parameter {
  let assert Ok(parameter) = json.parse(raw, generate.parameter_decoder())
    as "inline parameter snippet must decode"
  parameter
}

pub fn minimal_method_decodes_with_defaults_test() {
  parse_method(
    "{\"id\": \"youtube.videos.list\", \"path\": \"youtube/v3/videos\", \"httpMethod\": \"GET\"}",
  )
  |> should.equal(Method(
    "youtube.videos.list",
    "youtube/v3/videos",
    Get,
    None,
    dict.new(),
    [],
    None,
    None,
    [],
    None,
    False,
    False,
  ))
}

pub fn unknown_http_method_fails_test() {
  json.parse(
    "{\"id\": \"x\", \"path\": \"y\", \"httpMethod\": \"PATCH\"}",
    generate.method_decoder(),
  )
  |> should.be_error
}

pub fn each_http_method_decodes_test() {
  let method = fn(http) {
    parse_method(
      "{\"id\": \"x\", \"path\": \"y\", \"httpMethod\": \"" <> http <> "\"}",
    ).http_method
  }
  should.equal(method("GET"), Get)
  should.equal(method("POST"), Post)
  should.equal(method("PUT"), Put)
  should.equal(method("DELETE"), Delete)
}

pub fn request_response_refs_decode_test() {
  let method =
    parse_method(
      "{\"id\": \"x\", \"path\": \"y\", \"httpMethod\": \"POST\", \"request\": {\"$ref\": \"Video\"}, \"response\": {\"$ref\": \"VideoListResponse\"}}",
    )
  should.equal(method.request, Some("Video"))
  should.equal(method.response, Some("VideoListResponse"))
}

pub fn minimal_parameter_decodes_with_defaults_test() {
  parse_parameter("{\"location\": \"query\", \"type\": \"string\"}")
  |> should.equal(Parameter(
    Query,
    ParamString,
    None,
    None,
    False,
    False,
    None,
    None,
    None,
    [],
    False,
  ))
}

pub fn unknown_parameter_location_fails_test() {
  json.parse(
    "{\"location\": \"header\", \"type\": \"string\"}",
    generate.parameter_decoder(),
  )
  |> should.be_error
}

pub fn unknown_parameter_type_fails_test() {
  json.parse(
    "{\"location\": \"query\", \"type\": \"null\"}",
    generate.parameter_decoder(),
  )
  |> should.be_error
}

// ---------------------------------------------------------------------------
// Generated `decoder()` tests, including live roundtrips through the
// generated youtube modules
// ---------------------------------------------------------------------------

pub fn generated_decoder_uses_original_json_keys_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let assert Ok(schema) = dict.get(schemas, "PageInfo")
  let code = generate.build_module("PageInfo", schema)
  // Gleam fields are snake_case but the wire keys stay camelCase.
  should.be_true(string.contains(code, "\"resultsPerPage\""))
  should.be_true(string.contains(code, "\"totalResults\""))
  should.be_true(string.contains(code, "pub fn decoder() -> Decoder(PageInfo)"))
}

pub fn every_schema_generates_a_decoder_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let missing =
    dict.to_list(schemas)
    |> list.filter(fn(item) {
      !string.contains(
        generate.build_module(item.0, item.1),
        "pub fn decoder()",
      )
    })
    |> list.map(fn(item) { item.0 })
  should.equal(missing, [])
}

pub fn every_schema_generates_an_encoder_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let missing =
    dict.to_list(schemas)
    |> list.filter(fn(item) {
      !string.contains(generate.build_module(item.0, item.1), "pub fn to_json(")
    })
    |> list.map(fn(item) { item.0 })
  should.equal(missing, [])
}

pub fn generated_encoder_roundtrip_test() {
  let info = page_info.PageInfo(Some(10), None)
  let assert Ok(back) =
    page_info.to_json(info)
    |> json.to_string
    |> json.parse(page_info.decoder())
  should.equal(back, info)
}

pub fn generated_encoder_handles_enums_and_nesting_test() {
  let status =
    playlist_item_status.PlaylistItemStatus(Some(
      playlist_item_status.PrivacyStatusUnlisted,
    ))
  playlist_item_status.to_json(status)
  |> json.to_string
  |> should.equal("{\"privacyStatus\":\"unlisted\"}")
  let assert Ok(back) =
    playlist_item_status.to_json(status)
    |> json.to_string
    |> json.parse(playlist_item_status.decoder())
  should.equal(back, status)
}

pub fn generated_decoder_decodes_scalars_test() {
  json.parse(
    "{\"totalResults\": 5, \"resultsPerPage\": 10}",
    page_info.decoder(),
  )
  |> should.equal(Ok(page_info.PageInfo(Some(10), Some(5))))
}

pub fn generated_decoder_defaults_missing_fields_to_none_test() {
  json.parse("{}", page_info.decoder())
  |> should.equal(Ok(page_info.PageInfo(None, None)))
}

pub fn generated_decoder_decodes_nested_refs_and_lists_test() {
  let assert Ok(snippet) =
    json.parse(
      "{\"title\": \"Hello\", \"tags\": [\"a\", \"b\"], \"thumbnails\": {\"default\": {\"url\": \"https://x/y.jpg\"}}}",
      video_snippet.decoder(),
    )
  should.equal(snippet.title, Some("Hello"))
  should.equal(snippet.tags, Some(["a", "b"]))
  let assert Some(thumbnails) = snippet.thumbnails
  let assert Some(default) = thumbnails.default
  should.equal(default.url, Some("https://x/y.jpg"))
}

pub fn generated_decoder_decodes_string_maps_test() {
  let assert Ok(list) =
    json.parse(
      "{\"id\": \"PL1\", \"localizations\": {\"en\": {\"title\": \"Hi\"}}}",
      playlist.decoder(),
    )
  should.equal(list.id, Some("PL1"))
  let assert Some(localizations) = list.localizations
  let assert Ok(entry) = dict.get(localizations, "en")
  should.equal(entry.title, Some("Hi"))
}

// ---------------------------------------------------------------------------
// Generated string-enum tests
// ---------------------------------------------------------------------------

pub fn generated_enum_type_and_helpers_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let assert Ok(schema) = dict.get(schemas, "PlaylistItemStatus")
  let code = generate.build_module("PlaylistItemStatus", schema)
  // Field type is the custom enum, not String.
  should.be_true(string.contains(code, "privacy_status: Option(PrivacyStatus)"))
  should.be_true(string.contains(code, "pub type PrivacyStatus {"))
  should.be_true(string.contains(
    code,
    "pub fn privacy_status_to_string(value: PrivacyStatus) -> String",
  ))
  should.be_true(string.contains(
    code,
    "pub fn privacy_status_decoder() -> Decoder(PrivacyStatus)",
  ))
}

pub fn generated_enum_to_string_test() {
  playlist_item_status.privacy_status_to_string(
    playlist_item_status.PrivacyStatusPrivate,
  )
  |> should.equal("private")
  playlist_item_status.privacy_status_to_string(
    playlist_item_status.PrivacyStatusPublic,
  )
  |> should.equal("public")
}

pub fn generated_enum_decodes_through_parent_test() {
  let assert Ok(status) =
    json.parse(
      "{\"privacyStatus\": \"private\"}",
      playlist_item_status.decoder(),
    )
  should.equal(
    status.privacy_status,
    Some(playlist_item_status.PrivacyStatusPrivate),
  )
}

pub fn generated_enum_rejects_unknown_values_test() {
  json.parse(
    "{\"privacyStatus\": \"sometimes\"}",
    playlist_item_status.decoder(),
  )
  |> should.be_error
}

pub fn generated_enum_sanitizes_digit_led_values_test() {
  let Discovery(schemas:, ..) = load_discovery()
  let assert Ok(schema) = dict.get(schemas, "CdnSettings")
  let code = generate.build_module("CdnSettings", schema)
  // `240p` is not a valid constructor name on its own.
  should.be_true(string.contains(code, "ResolutionValue240p"))
  should.be_true(string.contains(code, "FrameRateVariable"))
}

pub fn generated_enum_decodes_arrays_test() {
  let assert Ok(suggestions) =
    json.parse(
      "{\"processingWarnings\": [\"hasEditlist\", \"unknownContainer\"]}",
      video_suggestions.decoder(),
    )
  should.equal(
    suggestions.processing_warnings,
    Some([
      video_suggestions.ProcessingWarningsHasEditlist,
      video_suggestions.ProcessingWarningsUnknownContainer,
    ]),
  )
}

// ---------------------------------------------------------------------------
// Request builder tests: resources flatten, fluent builders render
// ---------------------------------------------------------------------------

pub fn resources_flatten_to_32_builder_modules_test() {
  let Discovery(resources:, ..) = load_discovery()
  let flat = generate.flatten_resources(resources)
  should.equal(list.length(flat), 32)
  // The only nested resource tree lands in its own module.
  should.be_true(
    list.any(flat, fn(item) { item.0 == "youtube_v3_live_chat_messages" }),
  )
  // Every one of the 83 methods is accounted for exactly once.
  should.equal(
    list.fold(flat, 0, fn(total, item) { total + list.length(item.1) }),
    83,
  )
}

pub fn fluent_builder_renders_full_request_test() {
  let request =
    videos_api.list(["snippet", "id"])
    |> videos_api.list_with_max_results(10)
    |> videos_api.list_with_chart(videos_api.ListChartMostPopular)
    |> videos_api.list_request
  should.equal(request.method, http.Get)
  should.equal(request.path, "youtube/v3/videos")
  should.equal(request.query, [
    #("part", "snippet"),
    #("part", "id"),
    #("chart", "mostPopular"),
    #("maxResults", "10"),
  ])
  should.equal(request.headers, [])
  should.equal(request.body, None)
  should.be_true(list.contains(
    request.scopes,
    "https://www.googleapis.com/auth/youtube.readonly",
  ))
}

pub fn fluent_builder_appends_repeated_values_test() {
  let request =
    videos_api.list(["snippet"])
    |> videos_api.list_add_part("id")
    |> videos_api.list_request
  should.equal(request.query, [#("part", "snippet"), #("part", "id")])
}

pub fn fluent_builder_renders_path_template_test() {
  let request =
    captions_api.download("abc123")
    |> captions_api.download_request
  should.equal(request.path, "youtube/v3/captions/abc123")
  should.equal(request.method, http.Get)
}

pub fn fluent_builder_encodes_typed_body_test() {
  // Playlist fields are alphabetical: content_details, etag, id, ...
  let body =
    playlist.Playlist(None, None, Some("PL1"), None, None, None, None, None)
  let request =
    playlists_api.insert(["snippet"])
    |> playlists_api.insert_request(body)
  should.equal(request.method, http.Post)
  should.equal(request.path, "youtube/v3/playlists")
  let assert Some(raw) = request.body
  let assert Ok(back) = json.parse(raw, playlist.decoder())
  should.equal(back, body)
}

// ---------------------------------------------------------------------------
// Sans-IO runtime tests
// ---------------------------------------------------------------------------

pub fn authorize_appends_api_key_to_query_test() {
  let request =
    videos_api.list(["snippet"])
    |> videos_api.list_request
    |> api_request.authorize(api_request.ApiKey("KEY"))
  should.equal(request.query, [#("key", "KEY"), #("part", "snippet")])
}

pub fn authorize_adds_bearer_header_test() {
  let request =
    videos_api.list(["snippet"])
    |> videos_api.list_request
    |> api_request.authorize(api_request.OAuthToken("TOKEN"))
  should.equal(request.headers, [#("Authorization", "Bearer TOKEN")])
}

pub fn parse_response_decodes_success_test() {
  api_request.parse_response(
    200,
    "{\"totalResults\": 3, \"resultsPerPage\": 1}",
    page_info.decoder(),
  )
  |> should.equal(Ok(page_info.PageInfo(Some(1), Some(3))))
}

pub fn parse_response_maps_api_errors_test() {
  let body =
    "{\"error\": {\"code\": 403, \"message\": \"Access forbidden\", \"errors\": [{\"reason\": \"forbidden\"}]}}"
  api_request.parse_response(403, body, page_info.decoder())
  |> should.equal(
    Error(
      api_request.HttpError(api_request.ApiError(403, 403, "Access forbidden")),
    ),
  )
}

pub fn parse_response_maps_decode_failures_test() {
  api_request.parse_response(
    200,
    "{\"totalResults\": \"many\"}",
    page_info.decoder(),
  )
  |> should.be_error
}

pub fn http_method_to_string_test() {
  // Verbs come from gleam_http so requests plug into ecosystem clients.
  should.equal(http.method_to_string(http.Get), "GET")
  should.equal(http.method_to_string(http.Delete), "DELETE")
}

pub fn to_url_encodes_query_test() {
  let url =
    videos_api.list(["snippet"])
    |> videos_api.list_with_max_results(5)
    |> videos_api.list_request
    |> api_httpc.to_url
  should.equal(
    url,
    "https://www.googleapis.com/youtube/v3/videos?part=snippet&maxResults=5",
  )
}

pub fn httpc_ffi_shim_is_packaged_test() {
  // Gleam never checks `@external` targets at compile time: a missing
  // Erlang shim only explodes at runtime. Pin the file in place.
  simplifile.is_file("src/gleam_youtube_api_v3_httpc_ffi.erl")
  |> should.equal(Ok(True))
}
