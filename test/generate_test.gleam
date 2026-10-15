import generate.{
  type Discovery, type Kind, type Schema, Array, Boolean, Discovery, Integer,
  Number, Object, Ref, Schema, Str,
}
import gleam/dict
import gleam/json
import gleam/list
import gleam/option.{None, Some}
import gleam/set
import gleam/string
import gleeunit/should
import simplifile

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
  let Discovery(schemas:) = load_discovery()
  // Guard against silently decoding an empty/truncated document.
  should.equal(dict.size(schemas), 209)
}

pub fn every_top_level_schema_is_an_object_test() {
  let Discovery(schemas:) = load_discovery()
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
  let Discovery(schemas:) = load_discovery()
  let names = dict.keys(schemas) |> set.from_list
  let missing =
    all_schemas(Discovery(schemas:))
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
  let Discovery(schemas:) = load_discovery()
  // Spot-check a schema known to carry enum + enumDescriptions alongside
  // the type (extra keys the decoder must tolerate, not choke on).
  let assert Ok(status) = dict.get(schemas, "PlaylistItemStatus")
  let assert Object(properties:, ..) = status.kind
  let assert Ok(privacy) = dict.get(properties, "privacyStatus")
  should.equal(privacy.kind, Str(None, ["public", "unlisted", "private"]))
}

pub fn nested_object_properties_are_decoded_test() {
  let Discovery(schemas:) = load_discovery()
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
  let Discovery(schemas:) = load_discovery()
  // 4 properties use additionalProperties: $ref (Video/Channel/Playlist/
  // ChannelSection localizations). They live on properties, not on
  // top-level schemas, so walk the whole tree.
  let with_additional =
    all_schemas(Discovery(schemas:))
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
  let Discovery(schemas:) = load_discovery()
  // TokenPagination has no properties at all.
  let assert Ok(token) = dict.get(schemas, "TokenPagination")
  let assert Object(properties:, additional:) = token.kind
  should.equal(dict.size(properties), 0)
  should.equal(additional, None)
}

pub fn array_items_variants_are_decoded_test() {
  let Discovery(schemas:) = load_discovery()
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
