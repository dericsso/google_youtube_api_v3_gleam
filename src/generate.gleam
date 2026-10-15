import gleam/dict.{type Dict}
import gleam/dynamic/decode
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string
import simplifile

const discovery_file_path = "discovery/2026-10-16_discovery_document.json"

pub type DiscoveryError {
  ReadFailed(simplifile.FileError)
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
  parse_discovery(content)
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

pub fn main() -> Nil {
  case run() {
    Ok(discovery) -> {
      io.println("schemas: " <> int.to_string(dict.size(discovery.schemas)))
      use l <- list.each(discovery.schemas |> dict.to_list)
      echo l
      Nil
    }
    Error(ReadFailed(err)) -> io.println_error(simplifile.describe_error(err))
    Error(ParseFailed(err)) ->
      io.println_error("failed to parse: " <> string.inspect(err))
  }
}
