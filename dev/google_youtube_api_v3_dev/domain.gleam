import gleam/dict.{type Dict}
import gleam/dynamic/decode
import gleam/option.{type Option, None, Some}

pub type Discovery {
  Discovery(schemas: Dict(String, Schema), resources: Dict(String, Resource))
}

pub type Resource {
  Resource(methods: Dict(String, Method), nested: Dict(String, Resource))
}

pub type HttpMethod {
  Get
  Post
  Put
  Delete
}

pub type Location {
  Query
  Path
}

pub type ParamType {
  ParamString
  ParamInteger
  ParamBoolean
}

pub type Method {
  Method(
    id: String,
    path: String,
    http_method: HttpMethod,
    description: Option(String),
    parameters: Dict(String, Parameter),
    parameter_order: List(String),
    request: Option(String),
    response: Option(String),
    scopes: List(String),
    media_upload: Option(MediaUpload),
    supports_media_upload: Bool,
    supports_media_download: Bool,
  )
}

pub type MediaUpload {
  MediaUpload(
    accept: List(String),
    max_size: Option(String),
    protocols: List(String),
  )
}

pub type Parameter {
  Parameter(
    location: Location,
    param_type: ParamType,
    format: Option(String),
    description: Option(String),
    required: Bool,
    repeated: Bool,
    default: Option(String),
    minimum: Option(String),
    maximum: Option(String),
    enum: List(String),
    deprecated: Bool,
  )
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

pub fn root_decoder() -> decode.Decoder(Discovery) {
  use schemas <- decode.field(
    "schemas",
    decode.dict(decode.string, schema_decoder()),
  )
  use resources <- decode.field(
    "resources",
    decode.dict(decode.string, resource_decoder()),
  )
  decode.success(Discovery(schemas:, resources:))
}

pub fn resource_decoder() -> decode.Decoder(Resource) {
  use <- decode.recursive
  use methods <- decode.optional_field(
    "methods",
    dict.new(),
    decode.dict(decode.string, method_decoder()),
  )
  use nested <- decode.optional_field(
    "resources",
    dict.new(),
    decode.dict(decode.string, resource_decoder()),
  )
  decode.success(Resource(methods:, nested:))
}

pub fn method_decoder() -> decode.Decoder(Method) {
  use id <- decode.field("id", decode.string)
  use path <- decode.field("path", decode.string)
  use http_method <- decode.then(http_method_decoder())
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use parameters <- decode.optional_field(
    "parameters",
    dict.new(),
    decode.dict(decode.string, parameter_decoder()),
  )
  use parameter_order <- decode.optional_field(
    "parameterOrder",
    [],
    decode.list(decode.string),
  )
  use request <- decode.optional_field(
    "request",
    None,
    decode.optional(decode.at(["$ref"], decode.string)),
  )
  use response <- decode.optional_field(
    "response",
    None,
    decode.optional(decode.at(["$ref"], decode.string)),
  )
  use scopes <- decode.optional_field("scopes", [], decode.list(decode.string))
  use media_upload <- decode.optional_field(
    "mediaUpload",
    None,
    decode.optional(media_upload_decoder()),
  )
  use supports_media_upload <- decode.optional_field(
    "supportsMediaUpload",
    False,
    decode.bool,
  )
  use supports_media_download <- decode.optional_field(
    "supportsMediaDownload",
    False,
    decode.bool,
  )
  decode.success(Method(
    id:,
    path:,
    http_method:,
    description:,
    parameters:,
    parameter_order:,
    request:,
    response:,
    scopes:,
    media_upload:,
    supports_media_upload:,
    supports_media_download:,
  ))
}

fn http_method_decoder() -> decode.Decoder(HttpMethod) {
  use method <- decode.field("httpMethod", decode.string)
  case method {
    "GET" -> decode.success(Get)
    "POST" -> decode.success(Post)
    "PUT" -> decode.success(Put)
    "DELETE" -> decode.success(Delete)
    other -> decode.failure(Get, "a known HTTP method, got " <> other)
  }
}

pub fn media_upload_decoder() -> decode.Decoder(MediaUpload) {
  use accept <- decode.optional_field("accept", [], decode.list(decode.string))
  use max_size <- decode.optional_field(
    "maxSize",
    None,
    decode.optional(decode.string),
  )
  use protocols <- decode.optional_field(
    "protocols",
    dict.new(),
    decode.dict(decode.string, decode.dynamic),
  )
  decode.success(MediaUpload(
    accept:,
    max_size:,
    protocols: dict.keys(protocols),
  ))
}

pub fn parameter_decoder() -> decode.Decoder(Parameter) {
  use location <- decode.then(location_decoder())
  use param_type <- decode.then(param_type_decoder())
  use format <- decode.optional_field(
    "format",
    None,
    decode.optional(decode.string),
  )
  use description <- decode.optional_field(
    "description",
    None,
    decode.optional(decode.string),
  )
  use required <- decode.optional_field("required", False, decode.bool)
  use repeated <- decode.optional_field("repeated", False, decode.bool)
  use default <- decode.optional_field(
    "default",
    None,
    decode.optional(decode.string),
  )
  use minimum <- decode.optional_field(
    "minimum",
    None,
    decode.optional(decode.string),
  )
  use maximum <- decode.optional_field(
    "maximum",
    None,
    decode.optional(decode.string),
  )
  use enum <- decode.optional_field("enum", [], decode.list(decode.string))
  use deprecated <- decode.optional_field("deprecated", False, decode.bool)
  decode.success(Parameter(
    location:,
    param_type:,
    format:,
    description:,
    required:,
    repeated:,
    default:,
    minimum:,
    maximum:,
    enum:,
    deprecated:,
  ))
}

fn location_decoder() -> decode.Decoder(Location) {
  use location <- decode.field("location", decode.string)
  case location {
    "query" -> decode.success(Query)
    "path" -> decode.success(Path)
    other -> decode.failure(Query, "a known parameter location, got " <> other)
  }
}

fn param_type_decoder() -> decode.Decoder(ParamType) {
  use param_type <- decode.field("type", decode.string)
  case param_type {
    "string" -> decode.success(ParamString)
    "integer" -> decode.success(ParamInteger)
    "boolean" -> decode.success(ParamBoolean)
    other ->
      decode.failure(ParamString, "a known parameter type, got " <> other)
  }
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
