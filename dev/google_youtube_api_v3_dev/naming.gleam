import gleam/dict.{type Dict}
import gleam/list
import gleam/string
import justin

const standalone_schemas = [
  "page_info",
  "token_pagination",
  "resource_id",
]

fn singleton_owner(name: String) -> Result(String, Nil) {
  case name {
    "batch_get_stats_response"
    | "content_rating"
    | "geo_point"
    | "access_policy"
    | "brand_partner" -> Ok("video")
    "image_settings" | "watch_settings" | "property_value" -> Ok("channel")
    "cdn_settings" | "monitor_stream_info" | "ingestion_info" -> Ok("live")
    "interval" -> Ok("availability")
    "level_details" -> Ok("memberships")
    "entity" | "related_entity" -> Ok("abuse")
    "language_tag" -> Ok("localized")
    _ -> Error(Nil)
  }
}

fn first_token(name: String) -> String {
  case string.split(name, "_") {
    [head, ..] -> head
    [] -> name
  }
}

pub fn group_of(name: String) -> String {
  case list.contains(standalone_schemas, name) {
    True -> name
    False ->
      case singleton_owner(name) {
        Ok(group) -> group
        Error(Nil) -> rename_group(first_token(name))
      }
  }
}

fn rename_group(token: String) -> String {
  case token {
    "test" -> "tests"
    other -> other
  }
}

pub fn schema_group_of(schema_name: String) -> String {
  group_of(justin.snake_case(schema_name))
}

pub fn group_map(schemas: Dict(String, a)) -> Dict(String, String) {
  schemas
  |> dict.to_list
  |> list.map(fn(kv) { #(kv.0, group_of(justin.snake_case(kv.0))) })
  |> dict.from_list
}

pub fn group_schemas(
  schemas: Dict(String, a),
) -> Dict(String, List(#(String, a))) {
  schemas
  |> dict.to_list
  |> list.sort(by: fn(a, b) { string.compare(a.0, b.0) })
  |> list.fold(dict.new(), fn(acc, kv) {
    let group = group_of(justin.snake_case(kv.0))
    let current = case dict.get(acc, group) {
      Ok(existing) -> existing
      Error(Nil) -> []
    }
    dict.insert(acc, group, list.append(current, [kv]))
  })
}

pub fn enum_variant_stem(value: String) -> String {
  let base = justin.pascal_case(value)
  let alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  case string.to_graphemes(base) {
    [first, ..] ->
      case string.contains(alpha, first) {
        True -> base
        False -> "Value" <> base
      }
    _ -> "Value" <> base
  }
}

pub fn sanitize_field(name: String) -> String {
  case name {
    "as"
    | "assert"
    | "auto"
    | "case"
    | "const"
    | "delegate"
    | "derive"
    | "echo"
    | "else"
    | "fn"
    | "if"
    | "import"
    | "let"
    | "opaque"
    | "panic"
    | "pub"
    | "test"
    | "todo"
    | "type"
    | "use"
    | "bool"
    | "decode"
    | "decoder"
    | "dict"
    | "dynamic"
    | "float"
    | "int"
    | "json"
    | "list"
    | "option"
    | "optional"
    | "optional_field"
    | "string"
    | "success" -> name <> "_"
    _ -> name
  }
}
