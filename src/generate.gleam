import gleam/dict.{type Dict}
import gleam/dynamic/decode
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string
import gleamgen/import_.{type ImportReference}
import gleamgen/module
import gleamgen/module/definition.{type Definition}
import gleamgen/render
import gleamgen/type_.{type GeneratedType}
import gleamgen/type_/custom
import gleamgen/type_/variant
import justin
import simplifile.{type FileError}

const discovery_file_path = "discovery/2026-10-16_discovery_document.json"

pub type DiscoveryError {
  ReadFailed(FileError)
  WriteFailed(FileError)
  ParseFailed(json.DecodeError)
}

pub type Discovery {
  Discovery(schemas: Dict(String, Schema))
}

pub type Schema {
  Schema(description: Option(String), kind: Kind)
}

pub type Kind {
  Ref(name: String)
  Str(format: Option(String), enum: List(String))
  Integer(format: Option(String))
  Number
  Boolean
  Any
  Array(items: Schema)
  Object(properties: Dict(String, Schema), additional: Option(Schema))
}

pub fn parse_discovery(content: String) -> Result(Discovery, DiscoveryError) {
  json.parse(content, root_decoder()) |> result.map_error(ParseFailed)
}

fn run() -> Result(Discovery, DiscoveryError) {
  use content <- result.try(
    simplifile.read(discovery_file_path) |> result.map_error(ReadFailed),
  )
  use discovery <- result.try(parse_discovery(content))
  use _ <- result.try(generate_code(discovery, "src/youtube"))
  Ok(discovery)
}

pub fn root_decoder() -> decode.Decoder(Discovery) {
  use schemas <- decode.field(
    "schemas",
    decode.dict(decode.string, schema_decoder()),
  )
  decode.success(Discovery(schemas:))
}

pub fn schema_decoder() -> decode.Decoder(Schema) {
  use <- decode.recursive
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use kind <- decode.then(kind_decoder())
  decode.success(Schema(description:, kind:))
}

pub fn kind_decoder() -> decode.Decoder(Kind) {
  use ref <- decode.optional_field("$ref", None, decode.optional(decode.string))
  case ref {
    Some(name) -> decode.success(Ref(name))
    None -> {
      use type_ <- decode.field("type", decode.string)
      case type_ {
        "string" -> {
          use format <- decode.optional_field(
            "format",
            None,
            decode.optional(decode.string),
          )
          use enum <- decode.optional_field(
            "enum",
            [],
            decode.list(decode.string),
          )
          decode.success(Str(format:, enum:))
        }
        "integer" -> {
          use format <- decode.optional_field(
            "format",
            None,
            decode.optional(decode.string),
          )
          decode.success(Integer(format:))
        }
        "number" -> decode.success(Number)
        "boolean" -> decode.success(Boolean)
        "any" -> decode.success(Any)
        "array" -> {
          use items <- decode.field("items", schema_decoder())
          decode.success(Array(items:))
        }
        "object" -> {
          use properties <- decode.optional_field(
            "properties",
            dict.new(),
            decode.dict(decode.string, schema_decoder()),
          )
          use additional <- decode.optional_field(
            "additionalProperties",
            None,
            decode.optional(schema_decoder()),
          )
          decode.success(Object(properties:, additional:))
        }
        other -> decode.failure(Any, "a known schema type, got " <> other)
      }
    }
  }
}

fn generate_code(
  discovery: Discovery,
  base_path: String,
) -> Result(Nil, DiscoveryError) {
  use _ <- result.try(
    initialize_directory(base_path) |> result.map_error(WriteFailed),
  )

  use item <- list.try_each(discovery.schemas |> dict.to_list)

  let #(key, schema) = item
  let file_name = justin.snake_case(key)
  let file_path = base_path <> "/" <> file_name <> ".gleam"
  let code = build_module(key, schema)
  echo code

  use _ <- result.try(
    simplifile.write(file_path, code) |> result.map_error(WriteFailed),
  )

  Ok(Nil)
}

/// Marker rendered as a `////` comment on top of every generated file.
pub const generated_notice: String = "DO NOT CHANGE, THIS IS AN AUTO GENERATED FILE FROM `generate.gleam`"

/// Build the full source text for a single schema file.
pub fn build_module(type_name: String, schema: Schema) -> String {
  let deps =
    collect_refs(schema)
    |> list.unique
    |> list.filter(fn(dep) { dep != type_name })
    |> list.sort(by: string.compare)

  let ref_imports =
    list.map(deps, fn(dep) {
      import_.new(["youtube", justin.snake_case(dep)])
      |> import_.with_unqualified_items([import_.unqualified_type(dep)])
    })
  let dict_needed = case schema.kind {
    Object(properties:, ..) ->
      dict.values(properties) |> list.any(contains_object)
    _ -> False
  }
  let dict_import =
    import_.new(["gleam", "dict"])
    |> import_.with_unqualified_items([import_.unqualified_type("Dict")])
  // Unqualified `Dict` keeps the import line only when actually used,
  // so only add it when a nested object requires a map type.
  let all_imports = case dict_needed {
    True -> [dict_import, ..ref_imports]
    False -> ref_imports
  }

  let mod =
    module.with_module_documentation_comments([generated_notice],
      fn() {
        use imported <- module.with_dynamic_imports(all_imports)
        let #(dict_ref, ref_modules) = case dict_needed {
          True -> {
            let assert [first, ..rest] = imported
            #(import_.import_to_reference(first), rest)
          }
          False -> #(import_.import_to_reference(dict_import), imported)
        }
        let ref_lookup =
          list.zip(deps, list.map(ref_modules, import_.import_to_reference))
          |> dict.from_list

        let #(fields, _nested) = case schema.kind {
          Object(properties:, ..) ->
            properties_to_fields(properties, ref_lookup, dict_ref)
          _ -> #([], [])
        }

        let details =
          definition.new(type_name)
          |> definition.with_publicity(True)
          |> with_description(schema.description)

        let variant =
          variant.new(type_name)
          |> variant.with_arguments_dynamic(fields)
        let builder = custom.new_dynamic([variant], [])

        use _type, _constructor <- module.with_custom_type_dynamic(
          details,
          builder,
        )
        module.eof()
      },
    )

  mod |> module.render(render.default_context()) |> render.to_string()
}

fn with_description(
  details: Definition,
  description: Option(String),
) -> Definition {
  case description {
    Some(doc) -> definition.with_documentation_comments(details, [doc])
    None -> details
  }
}

/// Turn top-level object properties into labelled constructor arguments.
/// Every field is optional in the discovery doc, so wrap in Option.
fn properties_to_fields(
  properties: Dict(String, Schema),
  ref_lookup: Dict(String, ImportReference),
  dict_ref: ImportReference,
) -> #(List(#(Option(String), GeneratedType(type_.Dynamic))), List(String)) {
  properties
  |> dict.to_list
  |> list.sort(fn(a, b) { string.compare(a.0, b.0) })
  |> list.map(fn(prop) {
    let #(name, prop_schema) = prop
    let field_name = sanitize_field(justin.snake_case(name))
    let inner = schema_to_type(prop_schema, ref_lookup, dict_ref)
    #(Some(field_name), type_.option(inner) |> type_.to_dynamic)
  })
  |> fn(fields) { #(fields, []) }
}

/// Gleam keywords can't be used as labelled-argument names.
fn sanitize_field(name: String) -> String {
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
    | "use" -> name <> "_"
    _ -> name
  }
}

fn schema_to_type(
  schema: Schema,
  ref_lookup: Dict(String, ImportReference),
  dict_ref: ImportReference,
) -> GeneratedType(type_.Dynamic) {
  case schema.kind {
    Ref(name) -> {
      case dict.get(ref_lookup, name) {
        Ok(ref) ->
          import_.raw_type(ref, name)
          |> custom.to_type
          |> type_.to_dynamic
        // Self-reference: no import needed.
        Error(Nil) -> type_.raw(name) |> type_.to_dynamic
      }
    }
    Str(_, _) -> type_.string |> type_.to_dynamic
    Integer(_) -> type_.int |> type_.to_dynamic
    Number -> type_.float |> type_.to_dynamic
    Boolean -> type_.bool |> type_.to_dynamic
    Any -> type_.string |> type_.to_dynamic
    Array(items:) ->
      type_.list(schema_to_type(items, ref_lookup, dict_ref))
      |> type_.to_dynamic
    Object(properties:, additional:) -> {
      case dict.is_empty(properties), additional {
        True, Some(extra) -> {
          let value = schema_to_type(extra, ref_lookup, dict_ref)
          import_.raw_type(dict_ref, "Dict")
          |> custom.to_type2(type_.string, value)
          |> type_.to_dynamic
        }
        // Inline object (e.g. relatedPlaylists) or empty marker object:
        // no named type yet, fall back to a string map for now.
        _, _ ->
          import_.raw_type(dict_ref, "Dict")
          |> custom.to_type2(type_.string, type_.string)
          |> type_.to_dynamic
      }
    }
  }
}

/// True when a nested object exists below this schema, meaning codegen
/// will emit a `Dict` map type for it.
fn contains_object(schema: Schema) -> Bool {
  case schema.kind {
    Object(..) -> True
    Array(items:) -> contains_object(items)
    Ref(_) | Str(_, _) | Integer(_) | Number | Boolean | Any -> False
  }
}

/// All $ref targets reachable from a schema (properties, array items,
/// additionalProperties).
fn collect_refs(schema: Schema) -> List(String) {
  case schema.kind {
    Ref(name) -> [name]
    Array(items:) -> collect_refs(items)
    Object(properties:, additional:) -> {
      let from_props = dict.values(properties) |> list.flat_map(collect_refs)
      let from_additional = case additional {
        Some(extra) -> collect_refs(extra)
        None -> []
      }
      list.flatten([from_props, from_additional])
    }
    Str(_, _) | Integer(_) | Number | Boolean | Any -> []
  }
}

fn initialize_directory(directory_path: String) -> Result(Nil, FileError) {
  use res <- result.try(simplifile.exists(directory_path, False))
  let res = case res {
    True -> Ok(Nil)
    False -> simplifile.create_directory(directory_path)
  }
  use _ <- result.try(res)
  simplifile.clear_directory(directory_path)
}

pub fn main() -> Nil {
  case run() {
    Ok(discovery) -> {
      io.println("schemas: " <> int.to_string(dict.size(discovery.schemas)))
      Nil
    }
    Error(ReadFailed(err)) | Error(WriteFailed(err)) ->
      io.println_error(simplifile.describe_error(err))
    Error(ParseFailed(err)) ->
      io.println_error("failed to parse: " <> string.inspect(err))
  }
}
