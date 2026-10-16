import gleam/bool
import gleam/dict.{type Dict}
import gleam/dynamic/decode
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string
import gleamgen/module.{type Module}
import gleamgen/module/definition
import gleamgen/render
import gleamgen/type_
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
  use a <- result.try(generate_code(discovery, "src/youtube"))
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
  use _ <- result.try(
    simplifile.create_file(file_path) |> result.map_error(WriteFailed),
  )
  Ok(Nil)
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

fn build_object(schema: Schema) {
  let my_type =
    custom.new()
    |> custom.with_variant(fn(_) { variant.new("MyType") })

  let mod = {
    use _type, _constructor <- module.with_custom_type1(
      definition.new("MyType") |> definition.with_publicity(True),
      my_type,
    )
    module.eof()
  }

  module.render(mod, render.default_context())
}

fn build_module(schema: Schema) -> Module {
  todo
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
