import gleam/dict.{type Dict}
import gleam/dynamic/decode
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string
import gleamgen/expression
import gleamgen/expression/block
import gleamgen/expression/case_
import gleamgen/expression/constructor
import gleamgen/function
import gleamgen/parameter
import gleamgen/pattern
import gleamgen/import_.{type ImportReference}
import gleamgen/module.{type Module}
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
  use scopes <- decode.optional_field(
    "scopes",
    [],
    decode.list(decode.string),
  )
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
  use accept <- decode.optional_field(
    "accept",
    [],
    decode.list(decode.string),
  )
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
    other -> decode.failure(ParamString, "a known parameter type, got " <> other)
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
  // so only add it when a nested object requires a map type. Plain
  // qualified imports would be dropped by gleamgen's unused-import pass.
  let dict_imports = case dict_needed {
    True -> [dict_import]
    False -> []
  }
  // Decode helpers are imported unqualified for the same reason: the
  // generated `decoder()` calls them bare (`optional_field`, `string`, …).
  // Only the helpers actually used are imported to avoid unused warnings.
  let props = case schema.kind {
    Object(properties:, ..) ->
      properties
      |> sorted_properties
      |> list.map(fn(prop) {
        let #(json_key, prop_schema) = prop
        #(
          json_key,
          sanitize_field(justin.snake_case(json_key)),
          prop_schema,
          property_enum(json_key, prop_schema),
        )
      })
    _ -> []
  }
  let enums =
    list.filter_map(props, fn(prop) {
      case prop.3 {
        Some(spec) -> Ok(#(spec, prop.2.description))
        None -> Error(Nil)
      }
    })
  let used_helpers =
    list.flat_map(props, fn(prop) {
      decoder_primitives(prop.2, prop.3)
    })
  let used_helpers = case enums {
    [] -> used_helpers
    _ -> list.flatten([used_helpers, ["string", "then", "failure"]])
  }
  let decode_import =
    import_.new(["gleam", "dynamic", "decode"])
    |> import_.with_unqualified_items([
      import_.unqualified_type("Decoder"),
      ..list.filter_map(decode_helper_order(), fn(name) {
        case list.contains(used_helpers, name) {
          True -> Ok(import_.unqualified_value(name))
          False -> Error(Nil)
        }
      })
    ])
  let all_imports =
    list.flatten([[decode_import], dict_imports, ref_imports])

  let mod =
    module.with_module_documentation_comments([generated_notice],
      fn() {
        use imported <- module.with_dynamic_imports(all_imports)
        let assert [decode_mod, ..rest1] = imported
        let decode_ref = import_.import_to_reference(decode_mod)
        let #(dict_mods, ref_modules) =
          list.split(rest1, case dict_needed {
            True -> 1
            False -> 0
          })
        let dict_ref = case dict_mods {
          [dict_mod, ..] -> import_.import_to_reference(dict_mod)
          [] -> import_.import_to_reference(dict_import)
        }
        let ref_lookup =
          list.zip(deps, list.map(ref_modules, import_.import_to_reference))
          |> dict.from_list

        let fields =
          list.map(props, fn(prop) {
            let #(_, field_name, prop_schema, field_enum) = prop
            let inner =
              schema_to_type(prop_schema, ref_lookup, dict_ref, field_enum)
            #(Some(field_name), type_.option(inner) |> type_.to_dynamic)
          })

        let details =
          definition.new(type_name)
          |> definition.with_publicity(True)
          |> with_description(schema.description)

        let variant =
          variant.new(type_name)
          |> variant.with_arguments_dynamic(fields)
        let builder = custom.new_dynamic([variant], [])

        use _type, constructors <- module.with_custom_type_dynamic(
          details,
          builder,
        )
        use _decoder_fn <- module.with_function(
          definition.new("decoder") |> definition.with_publicity(True),
          decoder_function(type_name, props, constructors, decode_ref, ref_lookup),
        )
        with_enums(enums, decode_ref, module.eof)
      },
    )

  mod |> module.render(render.default_context()) |> render.to_string()
}

/// Canonical order of decode helpers in generated import lines.
fn decode_helper_order() -> List(String) {
  [
    "optional_field",
    "optional",
    "string",
    "int",
    "float",
    "bool",
    "list",
    "dict",
    "success",
    "then",
    "failure",
  ]
}

/// Decode helpers used by one schema's `decoder()`, so the import line
/// stays minimal. `optional_field`/`optional`/`success` are always used.
fn decoder_primitives(
  schema: Schema,
  field_enum: Option(EnumSpec),
) -> List(String) {
  let base = ["optional_field", "optional", "success"]
  list.flatten([base, primitives_of(schema, field_enum)])
}

fn primitives_of(schema: Schema, field_enum: Option(EnumSpec)) -> List(String) {
  case schema.kind {
    Str(_, []) -> ["string"]
    Str(_, [_, ..]) ->
      case field_enum {
        Some(_) -> []
        None -> ["string"]
      }
    Integer(_) -> ["int"]
    Number -> ["float"]
    Boolean -> ["bool"]
    Any -> ["string"]
    Array(items:) -> ["list", ..primitives_of(items, field_enum)]
    Ref(_) -> []
    Object(properties:, additional:) ->
      case dict.is_empty(properties), additional {
        True, Some(extra) -> [
          "dict",
          "string",
          ..primitives_of(extra, None)
        ]
        _, _ -> ["dict", "string"]
      }
  }
}
/// Build the `decoder()` function body for one schema type:
/// `use field <- optional_field("jsonKey", None, optional(<inner>))`
/// chains ending in `success(TypeName(..))`.
fn decoder_function(
  type_name: String,
  props: List(#(String, String, Schema, Option(EnumSpec))),
  constructors: List(constructor.Constructor(a, b, c)),
  decode_ref: ImportReference,
  ref_lookup: Dict(String, ImportReference),
) -> function.Function(fn() -> type_.Dynamic, type_.Dynamic) {
  let d = fn(name) {
    import_.raw_ident(decode_ref, name) |> expression.to_dynamic
  }
  let call = fn(name, args) { expression.call_dynamic(d(name), args) }
  let ctor = case constructors {
    [ctor, ..] ->
      constructor.to_expression_dynamic(ctor) |> expression.to_dynamic
    [] -> expression.raw("Nil") |> expression.to_dynamic
  }
  let ctor_call = case props {
    [] -> ctor
    _ ->
      expression.call_dynamic(
        ctor,
        list.map(props, fn(prop) {
          expression.raw(prop.1) |> expression.to_dynamic
        }),
      )
  }
  let body =
    list.fold(list.reverse(props), expression.call_dynamic(d("success"), [
      ctor_call,
    ]    ), fn(acc, prop) {
      let #(json_key, field_name, prop_schema, field_enum) = prop
      let inner =
        call("optional", [
          value_decoder(prop_schema, decode_ref, ref_lookup, field_enum),
        ])
      let use_fn =
        block.use_function_dynamic(d("optional_field"), [
          expression.string(json_key) |> expression.to_dynamic,
          expression.option_none() |> expression.to_dynamic,
          inner,
        ])
      block.with_use_dynamic(use_fn, [field_name], fn(_) { acc })
    })
  function.new0(
    returns: import_.raw_type(decode_ref, "Decoder")
      |> custom.to_type1(type_.raw(type_name))
      |> type_.to_dynamic,
    handler: fn() { body },
  )
}

/// The inner (non-optional) JSON decoder for one schema.
fn value_decoder(
  schema: Schema,
  decode_ref: ImportReference,
  ref_lookup: Dict(String, ImportReference),
  field_enum: Option(EnumSpec),
) -> expression.Expression(type_.Dynamic) {
  let d = fn(name) {
    import_.raw_ident(decode_ref, name) |> expression.to_dynamic
  }
  let call = fn(name, args) { expression.call_dynamic(d(name), args) }
  case schema.kind {
    Str(_, []) -> d("string")
    Str(_, [_, ..]) ->
      case field_enum {
        Some(spec) ->
          expression.call_dynamic(
            expression.raw(spec.decoder_name) |> expression.to_dynamic,
            [],
          )
        None -> d("string")
      }
    Integer(_) -> d("int")
    Number -> d("float")
    Boolean -> d("bool")
    Any -> d("string")
    Array(items:) ->
      call("list", [
        value_decoder(items, decode_ref, ref_lookup, field_enum),
      ])
    Ref(name) -> {
      let callee = case dict.get(ref_lookup, name) {
        // Qualified call through the sibling's type import:
        // `video_snippet.decoder()`.
        Ok(ref) ->
          expression.imported_ident(ref, "decoder")
          |> expression.to_dynamic
        // Self-reference: the local `decoder()` being defined.
        Error(Nil) ->
          expression.raw("decoder") |> expression.to_dynamic
      }
      expression.call_dynamic(callee, [])
    }
    Object(properties:, additional:) -> {
      let value = case dict.is_empty(properties), additional {
        True, Some(extra) ->
          value_decoder(extra, decode_ref, ref_lookup, None)
        _, _ -> d("string")
      }
      call("dict", [d("string"), value])
    }
  }
}

/// One string-enum field and the custom type generated for it.
type EnumSpec {
  EnumSpec(
    type_name: String,
    to_string_name: String,
    decoder_name: String,
    variants: List(#(String, String)),
  )
}

/// The enum for a property when it (or its array items) is a string with
/// `enum` values. The custom type is named after the field.
fn property_enum(json_key: String, schema: Schema) -> Option(EnumSpec) {
  let target = case schema.kind {
    Array(items:) -> items.kind
    _ -> schema.kind
  }
  case target {
    Str(_, []) -> None
    Str(_, [_, ..] as values) -> {
      let stem = justin.snake_case(json_key)
      let type_name = justin.pascal_case(json_key)
      Some(EnumSpec(
        type_name:,
        to_string_name: stem <> "_to_string",
        decoder_name: stem <> "_decoder",
        variants: list.map(values, fn(value) {
          #(type_name <> enum_variant_stem(value), value)
        }),
      ))
    }
    _ -> None
  }
}

/// Constructor names must start with a letter: `240p` becomes `Value240p`.
/// Callers prefix with the enum type name since constructors are
/// module-scoped in Gleam.
fn enum_variant_stem(value: String) -> String {
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

/// Nest one custom type plus its `to_string`/`decoder` helpers per enum.
fn with_enums(
  enums: List(#(EnumSpec, Option(String))),
  decode_ref: ImportReference,
  handler: fn() -> Module,
) -> Module {
  case enums {
    [] -> handler()
    [#(spec, description), ..rest] -> {
      // new_dynamic renders variants in reverse, so feed them backwards
      // to keep declaration order (and constructor alignment) as documented.
      let variants =
        list.reverse(spec.variants)
        |> list.map(fn(v) { variant.new(v.0) |> variant.to_dynamic })
      let details =
        definition.new(spec.type_name)
        |> definition.with_publicity(True)
        |> with_description(description)
      use _type, constructors <- module.with_custom_type_dynamic(
        details,
        custom.new_dynamic(variants, []),
      )
      use _to_string <- module.with_function(
        definition.new(spec.to_string_name) |> definition.with_publicity(True),
        enum_to_string_fn(spec, constructors),
      )
      use _decoder <- module.with_function(
        definition.new(spec.decoder_name) |> definition.with_publicity(True),
        enum_decoder_fn(spec, constructors, decode_ref),
      )
      with_enums(rest, decode_ref, handler)
    }
  }
}

fn enum_to_string_fn(
  spec: EnumSpec,
  constructors: List(constructor.Constructor(a, b, c)),
) -> function.Function(fn(type_.Dynamic) -> type_.Dynamic, type_.Dynamic) {
  let body =
    list.fold(
      list.zip(spec.variants, constructors),
      case_.new(expression.raw("value")),
      fn(acc, pair) {
        let #(#(_, original), ctor) = pair
        case_.with_pattern(acc, pattern.from_constructor_dynamic(ctor, []), fn(
          _,
        ) { expression.string(original) })
      },
    )
    |> case_.build_expression
    |> expression.to_dynamic
  function.new1(
    param1: parameter.new(
      "value",
      type_.raw(spec.type_name) |> type_.to_dynamic,
    ),
    returns: type_.string |> type_.to_dynamic,
    handler: fn(_) { body },
  )
}

fn enum_decoder_fn(
  spec: EnumSpec,
  constructors: List(constructor.Constructor(a, b, c)),
  decode_ref: ImportReference,
) -> function.Function(fn() -> type_.Dynamic, type_.Dynamic) {
  let d = fn(name) {
    import_.raw_ident(decode_ref, name) |> expression.to_dynamic
  }
  let first_variant = case spec.variants {
    [#(name, _), ..] -> name
    [] -> "Unknown"
  }
  let on_value =
    list.fold(
      list.zip(spec.variants, constructors),
      case_.new(expression.raw("value")),
      fn(acc, pair) {
        let #(#(variant_name, original), _) = pair
        case_.with_pattern(acc, pattern.string_literal(original), fn(_) {
          expression.call_dynamic(
            d("success"),
            [expression.raw(variant_name) |> expression.to_dynamic],
          )
        })
      },
    )
  let on_value =
    case_.with_pattern(on_value, pattern.discard(), fn(_) {
      expression.call_dynamic(d("failure"), [
        expression.raw(first_variant) |> expression.to_dynamic,
        expression.string("a valid " <> spec.type_name)
          |> expression.to_dynamic,
      ])
    })
    |> case_.build_expression
    |> expression.to_dynamic
  let body =
    block.with_use_dynamic(
      block.use_function_dynamic(d("then"), [d("string")]),
      ["value"],
      fn(_) { on_value },
    )
  function.new0(
    returns: import_.raw_type(decode_ref, "Decoder")
      |> custom.to_type1(type_.raw(spec.type_name))
      |> type_.to_dynamic,
    handler: fn() { body },
  )
}

fn sorted_properties(
  properties: Dict(String, Schema),
) -> List(#(String, Schema)) {
  properties
  |> dict.to_list
  |> list.sort(fn(a, b) { string.compare(a.0, b.0) })
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

/// Gleam keywords can't be used as labelled-argument names. Decoder helper
/// names are also reserved so field bindings never shadow them in generated
/// `decoder()` bodies.
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
    | "use"
    | "bool"
    | "decoder"
    | "dict"
    | "dynamic"
    | "float"
    | "int"
    | "list"
    | "optional"
    | "optional_field"
    | "string"
    | "success" -> name <> "_"
    _ -> name
  }
}

fn schema_to_type(
  schema: Schema,
  ref_lookup: Dict(String, ImportReference),
  dict_ref: ImportReference,
  field_enum: Option(EnumSpec),
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
    Str(_, []) -> type_.string |> type_.to_dynamic
    Str(_, [_, ..]) ->
      case field_enum {
        Some(spec) -> type_.raw(spec.type_name) |> type_.to_dynamic
        None -> type_.string |> type_.to_dynamic
      }
    Integer(_) -> type_.int |> type_.to_dynamic
    Number -> type_.float |> type_.to_dynamic
    Boolean -> type_.bool |> type_.to_dynamic
    Any -> type_.string |> type_.to_dynamic
    Array(items:) ->
      type_.list(schema_to_type(items, ref_lookup, dict_ref, field_enum))
      |> type_.to_dynamic
    Object(properties:, additional:) -> {
      case dict.is_empty(properties), additional {
        True, Some(extra) -> {
          let value = schema_to_type(extra, ref_lookup, dict_ref, None)
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
