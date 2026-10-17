import gleam/dict.{type Dict}
import gleam/int
import gleam/io
import gleam/json
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/set.{type Set}
import gleam/string
import gleamgen/expression
import gleamgen/expression/block
import gleamgen/expression/case_
import gleamgen/expression/constructor
import gleamgen/function
import gleamgen/import_.{type ImportReference}
import gleamgen/module.{type Module}
import gleamgen/module/definition
import gleamgen/parameter
import gleamgen/pattern
import gleamgen/render
import gleamgen/type_.{type GeneratedType}
import gleamgen/type_/custom
import gleamgen/type_/variant
import google_youtube_api_v3_dev/domain.{
  type Discovery, type Method, type Parameter, type Resource, type Schema, Any,
  Array, Boolean, Delete, Get, Integer, Number, Object, ParamBoolean,
  ParamInteger, ParamString, Post, Put, Ref, Str,
}
import google_youtube_api_v3_dev/expressions
import google_youtube_api_v3_dev/naming
import google_youtube_api_v3_dev/paths
import google_youtube_api_v3_dev/rendering
import justin
import simplifile.{type FileError}

const discovery_file_path = "discovery/2026-10-16_discovery_document.json"

// ---------------------------------------------------------------------------
// Schema grouping: 209 discovery schemas share 21 domain modules (video,
// live, channel, ...) plus three universally-shared pagination primitives
// that stay in their own modules.
// ---------------------------------------------------------------------------

/// Types used by so many different groups that they keep their own module.
/// One-family types that don't share a first token with anything: they
/// merge into the group that actually references them. Placement was
/// checked against the generated import graph to stay acyclic.
/// The module hosting the named schema, snake_case.
pub fn group_of(name: String) -> String {
  naming.group_of(name)
}

/// Gleam reserves `test` for upcoming test syntax; the TestItem domain's
/// group takes the plural name instead (matching its `api/tests` module).
/// The group hosting a discovery (camelCase) schema name.
pub fn schema_group_of(schema_name: String) -> String {
  naming.schema_group_of(schema_name)
}

/// Every schema name mapped to its host module, snake_case.
pub fn group_map(schemas: Dict(String, a)) -> Dict(String, String) {
  naming.group_map(schemas)
}

pub fn parse_discovery(content: String) -> Result(Discovery, DiscoveryError) {
  json.parse(content, domain.root_decoder()) |> result.map_error(ParseFailed)
}

pub type DiscoveryError {
  ReadFailed(FileError)
  WriteFailed(FileError)
  ParseFailed(json.DecodeError)
}

fn run() -> Result(Discovery, DiscoveryError) {
  use content <- result.try(
    simplifile.read(discovery_file_path) |> result.map_error(ReadFailed),
  )
  use discovery <- result.try(parse_discovery(content))
  use _ <- result.try(generate_code(
    discovery,
    "src/google_youtube_api_v3/youtube",
  ))
  use _ <- result.try(generate_requests(
    discovery,
    "src/google_youtube_api_v3/youtube/api",
  ))
  Ok(discovery)
}

fn generate_code(
  discovery: Discovery,
  base_path: String,
) -> Result(Nil, DiscoveryError) {
  use _ <- result.try(
    rendering.initialize_directory(base_path) |> result.map_error(WriteFailed),
  )

  let groups = group_map(discovery.schemas)
  use item <- list.try_each(
    naming.group_schemas(discovery.schemas)
    |> dict.to_list
    |> list.sort(by: fn(a, b) { string.compare(a.0, b.0) }),
  )

  let #(group, schemas) = item
  let file_path = base_path <> "/" <> group <> ".gleam"
  let code = build_group_module(group, schemas, groups)

  use _ <- result.try(
    simplifile.write(file_path, code) |> result.map_error(WriteFailed),
  )

  Ok(Nil)
}

// ---------------------------------------------------------------------------
// Request builders: one fluent module per semantic API family under youtube/api
// ---------------------------------------------------------------------------

fn generate_requests(
  discovery: Discovery,
  base_path: String,
) -> Result(Nil, DiscoveryError) {
  use _ <- result.try(
    rendering.initialize_directory(base_path) |> result.map_error(WriteFailed),
  )

  use item <- list.try_each(grouped_resources(discovery.resources))

  let #(module_name, methods) = item
  let file_path = base_path <> "/" <> module_name <> ".gleam"
  let code = build_request_module(methods)

  use _ <- result.try(
    simplifile.write(file_path, code) |> result.map_error(WriteFailed),
  )

  Ok(Nil)
}

/// Every resource with methods, top-level and nested. Nested paths join
/// with underscores: `youtube/v3/liveChat/messages` becomes
/// `youtube_v3_live_chat_messages`.
pub fn flatten_resources(
  resources: Dict(String, Resource),
) -> List(#(String, List(#(String, Method)))) {
  dict.to_list(resources)
  |> list.flat_map(fn(item) { flatten_resource([item.0], item.1) })
  |> list.sort(fn(a, b) { string.compare(a.0, b.0) })
}

fn api_group_of(resource: String) -> String {
  let tokens = resource |> justin.snake_case |> string.split("_")
  case tokens {
    ["youtube", "v3", ..] -> "live"
    ["members", ..] | ["memberships", ..] -> "memberships"
    ["subscriptions", ..] -> "subscription"
    ["super", "chat", ..] -> "super_chat"
    ["third", "party", ..] -> "third_party_links"
    ["videos", ..] | ["video", ..] -> "video"
    ["channels", ..] | ["channel", ..] -> "channel"
    ["playlists", ..] | ["playlist", ..] -> "playlist"
    ["comments", ..] | ["comment", ..] -> "comment"
    ["activities", ..] | ["activity", ..] -> "activity"
    [head, ..] -> head
    [] -> resource
  }
}

fn grouped_resources(
  resources: Dict(String, Resource),
) -> List(#(String, List(#(String, String, Method)))) {
  let flattened = flatten_resources(resources)
  let resource_counts =
    flattened
    |> list.fold(dict.new(), fn(acc, item) {
      let group = api_group_of(item.0)
      let current = case dict.get(acc, group) {
        Ok(names) -> names
        Error(Nil) -> []
      }
      case list.contains(current, item.0) {
        True -> dict.insert(acc, group, current)
        False -> dict.insert(acc, group, list.append(current, [item.0]))
      }
    })
  flattened
  |> list.fold(dict.new(), fn(acc, item) {
    let #(resource, methods) = item
    let group = api_group_of(resource)
    let prefix = case dict.get(resource_counts, group) {
      Ok(names) -> list.length(names) > 1
      Error(Nil) -> False
    }
    let tagged =
      methods
      |> list.map(fn(method) {
        let method_name = case prefix {
          True -> resource <> "_" <> method.0
          False -> method.0
        }
        #(resource, method_name, method.1)
      })
    let current = case dict.get(acc, group) {
      Ok(existing) -> existing
      Error(Nil) -> []
    }
    dict.insert(acc, group, list.append(current, tagged))
  })
  |> dict.to_list
  |> list.map(fn(item) {
    #(item.0, list.sort(item.1, by: fn(a, b) { string.compare(a.1, b.1) }))
  })
  |> list.sort(by: fn(a, b) { string.compare(a.0, b.0) })
}

fn flatten_resource(
  path: List(String),
  resource: Resource,
) -> List(#(String, List(#(String, Method)))) {
  let here = case dict.is_empty(resource.methods) {
    True -> []
    False -> [
      #(
        string.join(list.map(path, justin.snake_case), with: "_"),
        resource.methods
          |> dict.to_list
          |> list.sort(fn(a, b) { string.compare(a.0, b.0) }),
      ),
    ]
  }
  list.flatten([
    here,
    dict.to_list(resource.nested)
      |> list.flat_map(fn(item) {
        flatten_resource(list.append(path, [item.0]), item.1)
      }),
  ])
}

/// One method's worth of builder inputs, computed up front.
type MethodSpec {
  MethodSpec(
    method_snake: String,
    method_pascal: String,
    method: Method,
    required: List(#(String, Parameter)),
    optional: List(#(String, Parameter)),
    enums: List(#(String, EnumSpec, Option(String))),
    body: Option(String),
  )
}

type BuilderCtx {
  BuilderCtx(
    runtime_ref: ImportReference,
    http_ref: ImportReference,
    decode_ref: ImportReference,
    option_ref: ImportReference,
    int_ref: ImportReference,
    bool_ref: ImportReference,
    list_ref: ImportReference,
    json_ref: ImportReference,
    body_lookup: Dict(String, ImportReference),
  )
}

fn to_method_spec(name: String, method: Method) -> MethodSpec {
  let params =
    method.parameters
    |> dict.to_list
    |> list.sort(fn(a, b) { string.compare(a.0, b.0) })
  let is_required = fn(item: #(String, Parameter)) { item.1.required }
  let ordered_required =
    list.filter_map(method.parameter_order, fn(key) {
      case list.find(params, fn(item) { item.0 == key }) {
        Ok(item) ->
          case is_required(item) {
            True -> Ok(item)
            False -> Error(Nil)
          }
        Error(Nil) -> Error(Nil)
      }
    })
  let ordered_keys = list.map(ordered_required, fn(item) { item.0 })
  let extra_required =
    list.filter(params, fn(item) {
      is_required(item) && !list.contains(ordered_keys, item.0)
    })
  let required = list.append(ordered_required, extra_required)
  let optional = list.filter(params, fn(item) { !is_required(item) })
  let method_pascal = justin.pascal_case(name)
  let enums =
    list.filter_map(params, fn(item) {
      case method_param_enum(method_pascal, item.0, item.1) {
        Some(spec) -> Ok(#(item.0, spec, item.1.description))
        None -> Error(Nil)
      }
    })
  MethodSpec(
    method_snake: justin.snake_case(name),
    method_pascal:,
    method:,
    required:,
    optional:,
    enums:,
    body: method.request,
  )
}

/// The string-enum type for one method parameter, prefixed with the method
/// name so constructors stay unique across the module.
fn method_param_enum(
  method_pascal: String,
  json_key: String,
  param: Parameter,
) -> Option(EnumSpec) {
  case param.enum {
    [] -> None
    [_, ..] as values -> {
      let type_name = method_pascal <> justin.pascal_case(json_key)
      let stem = justin.snake_case(type_name)
      Some(EnumSpec(
        type_name:,
        to_string_name: stem <> "_to_string",
        decoder_name: stem <> "_decoder",
        variants: list.map(values, fn(value) {
          #(type_name <> naming.enum_variant_stem(value), value)
        }),
      ))
    }
  }
}

fn enum_for(
  enums: List(#(String, EnumSpec, Option(String))),
  json_key: String,
) -> Option(EnumSpec) {
  case list.find(enums, fn(item) { item.0 == json_key }) {
    Ok(#(_, spec, _)) -> Some(spec)
    Error(Nil) -> None
  }
}

/// Build one `youtube/api/*` module: a fluent params builder per method.
fn build_request_module(methods: List(#(String, String, Method))) -> String {
  let specs = list.map(methods, fn(item) { to_method_spec(item.1, item.2) })
  let all_params =
    list.flat_map(specs, fn(spec) { list.append(spec.required, spec.optional) })
  let param_types = list.map(all_params, fn(item) { item.1.param_type })
  let has_enums = list.any(specs, fn(spec) { !list.is_empty(spec.enums) })
  let has_optional = list.any(specs, fn(spec) { !list.is_empty(spec.optional) })
  let bodies =
    list.filter_map(specs, fn(spec) {
      case spec.body {
        Some(body) -> Ok(body)
        None -> Error(Nil)
      }
    })
    |> list.unique
  // Map each body schema to its host group module for import dedup.
  let body_hosts =
    list.fold(bodies, dict.new(), fn(acc, body) {
      let host = group_of(justin.snake_case(body))
      let current = case dict.get(acc, host) {
        Ok(existing) -> existing
        Error(Nil) -> []
      }
      dict.insert(acc, host, list.append(current, [body]))
    })
  let runtime_import =
    import_.new(["google_youtube_api_v3", "request"])
    |> import_.with_unqualified_items([
      import_.unqualified_type("Request"),
      import_.unqualified_value("Request"),
    ])
  // Verbs come from gleam_http so generated requests plug into
  // ecosystem clients; only Get/Post/Put/Delete are ever emitted.
  let http_import = import_.new(["gleam", "http"])
  let tagged: List(#(String, import_.ImportedModule)) =
    list.flatten([
      [#("runtime", runtime_import), #("http", http_import)],
      case has_enums {
        True -> [
          #(
            "decode",
            import_.new(["gleam", "dynamic", "decode"])
              |> import_.with_unqualified_items([
                import_.unqualified_type("Decoder"),
              ]),
          ),
        ]
        False -> []
      },
      case has_optional {
        True -> [
          #(
            "option",
            import_.new(["gleam", "option"])
              |> import_.with_unqualified_items([
                import_.unqualified_type("Option"),
              ]),
          ),
        ]
        False -> []
      },
      // Body schemas share their group's module: one import per host
      // group, with an unqualified type item per schema.
      list.map(
        dict.to_list(body_hosts)
          |> list.sort(by: fn(a, b) { string.compare(a.0, b.0) }),
        fn(entry) {
          #(
            "body:" <> entry.0,
            import_.new(["google_youtube_api_v3", "youtube", entry.0])
              |> import_.with_unqualified_items(list.map(
                entry.1,
                import_.unqualified_type,
              )),
          )
        },
      ),
      case list.contains(param_types, ParamInteger) {
        True -> [#("int", import_.new(["gleam", "int"]))]
        False -> []
      },
      case list.contains(param_types, ParamBoolean) {
        True -> [#("bool", import_.new(["gleam", "bool"]))]
        False -> []
      },
      // Query segments always combine with `list.flatten`.
      [#("list", import_.new(["gleam", "list"]))],
      case bodies {
        [] -> []
        _ -> [#("json", import_.new(["gleam", "json"]))]
      },
    ])
  let mod =
    module.with_module_documentation_comments([], fn() {
      use imported <- module.with_dynamic_imports(
        list.map(tagged, fn(t) { t.1 }),
      )
      let refs =
        list.zip(
          list.map(tagged, fn(t) { t.0 }),
          list.map(imported, import_.import_to_reference),
        )
        |> dict.from_list
      let ctx =
        BuilderCtx(
          runtime_ref: ref_or(refs, "runtime", [
            "google_youtube_api_v3",
            "request",
          ]),
          http_ref: ref_or(refs, "http", ["gleam", "http"]),
          decode_ref: ref_or(refs, "decode", ["gleam", "dynamic", "decode"]),
          option_ref: ref_or(refs, "option", ["gleam", "option"]),
          int_ref: ref_or(refs, "int", ["gleam", "int"]),
          bool_ref: ref_or(refs, "bool", ["gleam", "bool"]),
          list_ref: ref_or(refs, "list", ["gleam", "list"]),
          json_ref: ref_or(refs, "json", ["gleam", "json"]),
          body_lookup: dict.to_list(body_hosts)
            |> list.sort(by: fn(a, b) { string.compare(a.0, b.0) })
            |> list.filter_map(fn(entry) {
              case dict.get(refs, "body:" <> entry.0) {
                Ok(ref) -> Ok(entry.1 |> list.map(fn(body) { #(body, ref) }))
                Error(Nil) -> Error(Nil)
              }
            })
            |> list.flatten
            |> dict.from_list,
        )
      with_request_methods(specs, ctx, fn() {
        with_enums(
          list.flat_map(specs, fn(spec) {
            list.map(spec.enums, fn(item) { #(item.1, item.2) })
          }),
          ctx.decode_ref,
          module.eof,
        )
      })
    })

  mod
  |> module.render(render.default_context())
  |> render.to_string()
  |> rendering.fix_empty_param_break()
}

fn ref_or(
  refs: Dict(String, ImportReference),
  tag: String,
  path: List(String),
) -> ImportReference {
  case dict.get(refs, tag) {
    Ok(ref) -> ref
    Error(Nil) -> import_.import_to_reference(import_.new(path))
  }
}

fn with_request_methods(
  specs: List(MethodSpec),
  ctx: BuilderCtx,
  handler: fn() -> Module,
) -> Module {
  case specs {
    [] -> handler()
    [spec, ..rest] ->
      with_request_method(spec, ctx, fn() {
        with_request_methods(rest, ctx, handler)
      })
  }
}

/// The params record, its constructor, fluent setters, and `to_request`.
fn with_request_method(
  spec: MethodSpec,
  ctx: BuilderCtx,
  handler: fn() -> Module,
) -> Module {
  let params_type = spec.method_pascal <> "Params"
  let ordered =
    list.append(
      list.map(spec.required, fn(item) { #(item, True) }),
      list.map(spec.optional, fn(item) { #(item, False) }),
    )
  let field_of = fn(item: #(String, Parameter)) {
    #(naming.sanitize_field(justin.snake_case(item.0)), item.1)
  }
  let fields =
    list.map(ordered, fn(pair) {
      let #(_item, is_required) = pair
      let #(field_name, param) = field_of(pair.0)
      let inner = param_value_type(param, enum_for(spec.enums, pair.0.0))
      let wrapped = case is_required {
        True -> inner
        False ->
          import_.raw_type(ctx.option_ref, "Option")
          |> custom.to_type1(inner)
          |> type_.to_dynamic
      }
      #(Some(field_name), wrapped)
    })
  let details =
    definition.new(params_type)
    |> definition.with_publicity(True)
    |> rendering.with_description(spec.method.description)
  use _type, constructors <- module.with_custom_type_dynamic(
    details,
    custom.new_dynamic(
      [
        variant.new(params_type)
        |> variant.with_arguments_dynamic(fields)
        |> variant.to_dynamic,
      ],
      [],
    ),
  )
  let ctor_expr = case constructors {
    [ctor, ..] ->
      constructor.to_expression_dynamic(ctor) |> expression.to_dynamic
    [] -> expression.raw("Nil") |> expression.to_dynamic
  }
  // Constructor takes the required params; optionals start empty.
  let required_args =
    list.map(spec.required, fn(item) {
      parameter.new(
        naming.sanitize_field(justin.snake_case(item.0)),
        param_value_type(item.1, enum_for(spec.enums, item.0))
          |> type_.to_dynamic,
      )
    })
  let init_for = fn(item: #(String, Parameter), is_required: Bool) {
    case is_required {
      True ->
        expression.raw(naming.sanitize_field(justin.snake_case(item.0)))
        |> expression.to_dynamic
      False -> expression.option_none() |> expression.to_dynamic
    }
  }
  let ctor_body =
    expression.call_dynamic(
      ctor_expr,
      list.map(ordered, fn(pair) { init_for(pair.0, pair.1) }),
    )
  use _ctor <- module.with_function(
    definition.new(spec.method_snake) |> definition.with_publicity(True),
    function.new_dynamic(
      parameters: required_args,
      returns: type_.raw(params_type) |> type_.to_dynamic,
      handler: fn(_) { ctor_body },
    ),
  )
  with_setters(spec, ctx, ctor_expr, ordered, fn() {
    with_to_request(spec, ctx, handler)
  })
}

/// Render one method call as a runtime `Request`: verb, path, query
/// segments, scopes, and an optional JSON body.
fn with_to_request(
  spec: MethodSpec,
  ctx: BuilderCtx,
  handler: fn() -> Module,
) -> Module {
  let params_type = spec.method_pascal <> "Params"
  let params = list.append(spec.required, spec.optional)
  // Segments combine with one `flatten`: an empty `[]` literal would
  // misrender as `[ , ]` once glam breaks the line, so empties below
  // always go through `expressions.empty_list()`.
  let query =
    expression.call_dynamic(expressions.qualified(ctx.list_ref, "flatten"), [
      expression.list(
        list.map(params, fn(item) {
          query_segment(item.0, item.1, enum_for(spec.enums, item.0), ctx)
        }),
      )
      |> expression.to_dynamic,
    ])
  let body_expr = case spec.body {
    None -> expression.option_none() |> expression.to_dynamic
    Some(body_name) -> {
      let assert Ok(body_ref) = dict.get(ctx.body_lookup, body_name)
      expressions.some(
        expression.call_dynamic(
          expressions.qualified(ctx.json_ref, "to_string"),
          [
            expression.call_dynamic(
              expressions.qualified(
                body_ref,
                justin.snake_case(body_name) <> "_to_json",
              ),
              [expressions.raw("body")],
            ),
          ],
        ),
      )
    }
  }
  let http_method = case spec.method.http_method {
    Get -> "Get"
    Post -> "Post"
    Put -> "Put"
    Delete -> "Delete"
  }
  let request_call =
    expression.call_dynamic(
      constructor.to_expression_dynamic(constructor.new(
        option.Some(ctx.runtime_ref),
        variant.new("Request") |> variant.to_dynamic,
      ))
        |> expression.to_dynamic,
      [
        expressions.qualified(ctx.http_ref, http_method),
        paths.path_expr(spec.method.path),
        query,
        expressions.empty_list(),
        expression.list(
          list.map(spec.method.scopes, fn(scope) {
            expression.string(scope) |> expression.to_dynamic
          }),
        )
          |> expression.to_dynamic,
        body_expr,
      ],
    )
  let returns =
    import_.raw_type(ctx.runtime_ref, "Request")
    |> custom.to_type
    |> type_.to_dynamic
  let func = case spec.body {
    None ->
      function.new1(
        param1: parameter.new(
          "params",
          type_.raw(params_type) |> type_.to_dynamic,
        ),
        returns:,
        handler: fn(_) { request_call },
      )
      |> function.to_dynamic
    Some(body_name) ->
      function.new2(
        param1: parameter.new(
          "params",
          type_.raw(params_type) |> type_.to_dynamic,
        ),
        param2: parameter.new("body", type_.raw(body_name) |> type_.to_dynamic),
        returns:,
        handler: fn(_, _) { request_call },
      )
      |> function.to_dynamic
  }
  use _fn <- module.with_function(
    definition.new(spec.method_snake <> "_request")
      |> definition.with_publicity(True),
    func,
  )
  handler()
}

/// One query parameter as a list of pairs: repeated params contribute one
/// pair per value, optional params contribute nothing when `None`.
fn query_segment(
  json_key: String,
  param: Parameter,
  field_enum: Option(EnumSpec),
  ctx: BuilderCtx,
) -> expression.Expression(type_.Dynamic) {
  let field_name = naming.sanitize_field(justin.snake_case(json_key))
  let pair = fn(value) {
    expression.tuple2(
      expression.string(json_key) |> expression.to_dynamic,
      query_value(value, param, field_enum, ctx),
    )
    |> expression.to_dynamic
  }
  case param.required, param.repeated {
    True, False ->
      expression.list([pair(expressions.access_field("params", field_name))])
      |> expression.to_dynamic
    True, True ->
      expression.call_dynamic(expressions.qualified(ctx.list_ref, "map"), [
        expressions.access_field("params", field_name),
        rendering.closure1("v", pair(expressions.raw("v"))),
      ])
    False, _ ->
      case_.new(
        expressions.option_subject(expressions.access_field(
          "params",
          field_name,
        )),
      )
      |> case_.with_pattern(pattern.option_some(pattern.variable("v")), fn(v) {
        case param.repeated {
          True ->
            expression.call_dynamic(expressions.qualified(ctx.list_ref, "map"), [
              v |> expression.to_dynamic,
              rendering.closure1("w", pair(expressions.raw("w"))),
            ])
          False ->
            expression.list([pair(v |> expression.to_dynamic)])
            |> expression.to_dynamic
        }
      })
      |> case_.with_pattern(pattern.option_none(), fn(_) {
        expressions.empty_list()
      })
      |> case_.build_expression
      |> expression.to_dynamic
  }
}

/// An empty list literal. Built raw because glam misrenders a broken
/// empty pretty-list as `[ , ]`.
/// Render one query value as a string.
fn query_value(
  value: expression.Expression(type_.Dynamic),
  param: Parameter,
  field_enum: Option(EnumSpec),
  ctx: BuilderCtx,
) -> expression.Expression(type_.Dynamic) {
  case param.param_type {
    ParamString ->
      case field_enum {
        Some(spec) ->
          expression.call_dynamic(
            expression.raw(spec.to_string_name) |> expression.to_dynamic,
            [value],
          )
        None -> value
      }
    ParamInteger ->
      expression.call_dynamic(expressions.qualified(ctx.int_ref, "to_string"), [
        value,
      ])
    ParamBoolean ->
      expression.call_dynamic(expressions.qualified(ctx.bool_ref, "to_string"), [
        value,
      ])
  }
}

/// A path with `{placeholders}` becomes string concatenations.
/// Only `captions.download` uses one, but this handles the general case.
/// `with_*` replaces one optional param, `add_*` appends one repeated value.
fn with_setters(
  spec: MethodSpec,
  ctx: BuilderCtx,
  ctor_expr: expression.Expression(type_.Dynamic),
  ordered: List(#(#(String, Parameter), Bool)),
  handler: fn() -> Module,
) -> Module {
  list.fold(spec.optional, handler(), fn(acc, item) {
    with_setter(spec, ctx, ctor_expr, ordered, "with", item, fn() {
      case item.1.repeated {
        True ->
          with_setter(spec, ctx, ctor_expr, ordered, "add", item, fn() { acc })
        False -> acc
      }
    })
  })
  |> fn(acc) {
    // Required repeated params (e.g. `part`) only get `add_*`.
    list.fold(spec.required, acc, fn(inner, item) {
      case item.1.repeated {
        True ->
          with_setter(spec, ctx, ctor_expr, ordered, "add", item, fn() { inner })
        False -> inner
      }
    })
  }
}

fn with_setter(
  spec: MethodSpec,
  ctx: BuilderCtx,
  ctor_expr: expression.Expression(type_.Dynamic),
  ordered: List(#(#(String, Parameter), Bool)),
  kind: String,
  item: #(String, Parameter),
  handler: fn() -> Module,
) -> Module {
  let #(json_key, param) = item
  let field_name = naming.sanitize_field(justin.snake_case(json_key))
  let field_enum = enum_for(spec.enums, json_key)
  let params_type = spec.method_pascal <> "Params"
  let is_required = param_required(spec, json_key)
  let arg_type = case kind {
    // `add_*` takes a single element, not the whole list.
    "add" -> param_base_type(param, field_enum)
    _ -> param_value_type(param, field_enum)
  }
  let single =
    expression.list([expressions.raw("value")]) |> expression.to_dynamic
  let appended =
    expression.call_dynamic(expressions.qualified(ctx.list_ref, "append"), [
      expressions.access_field("params", field_name),
      single,
    ])
  let new_value = case kind, is_required {
    "add", True -> appended
    "add", False ->
      case_.new(
        expressions.option_subject(expressions.access_field(
          "params",
          field_name,
        )),
      )
      |> case_.with_pattern(pattern.option_some(pattern.variable("vs")), fn(vs) {
        expressions.some(
          expression.call_dynamic(
            expressions.qualified(ctx.list_ref, "append"),
            [
              vs |> expression.to_dynamic,
              single,
            ],
          ),
        )
      })
      |> case_.with_pattern(pattern.option_none(), fn(_) {
        expressions.some(single)
      })
      |> case_.build_expression
      |> expression.to_dynamic
    _, _ -> expressions.some(expressions.raw("value"))
  }
  let rebuilt =
    expression.call_dynamic(
      ctor_expr,
      list.map(ordered, fn(pair) {
        let target =
          naming.sanitize_field(justin.snake_case(pair.0.0)) == field_name
        case target {
          True -> new_value
          False ->
            expressions.access_field(
              "params",
              naming.sanitize_field(justin.snake_case(pair.0.0)),
            )
        }
      }),
    )
  // Setters are prefixed with the method name: several methods in one
  // module can share parameter names.
  let setter_name = spec.method_snake <> "_" <> kind <> "_" <> field_name
  // A single-field record rebuild never reads `params`.
  let params_arg = case ordered {
    [_] if kind == "with" -> "_params"
    _ -> "params"
  }
  use _fn <- module.with_function(
    definition.new(setter_name) |> definition.with_publicity(True),
    function.new2(
      param1: parameter.new(
        params_arg,
        type_.raw(params_type) |> type_.to_dynamic,
      ),
      param2: parameter.new("value", arg_type |> type_.to_dynamic),
      returns: type_.raw(params_type) |> type_.to_dynamic,
      handler: fn(_, _) { rebuilt },
    ),
  )
  handler()
}

/// The plain (possibly listed) value type of one method parameter.
fn param_value_type(
  param: Parameter,
  field_enum: Option(EnumSpec),
) -> type_.GeneratedType(type_.Dynamic) {
  let base = param_base_type(param, field_enum)
  case param.repeated {
    True -> type_.list(base) |> type_.to_dynamic
    False -> base
  }
}

/// The single-element type of one method parameter.
fn param_base_type(
  param: Parameter,
  field_enum: Option(EnumSpec),
) -> type_.GeneratedType(type_.Dynamic) {
  case param.param_type {
    ParamString ->
      case field_enum {
        Some(spec) -> type_.raw(spec.type_name) |> type_.to_dynamic
        None -> type_.string |> type_.to_dynamic
      }
    ParamInteger -> type_.int |> type_.to_dynamic
    ParamBoolean -> type_.bool |> type_.to_dynamic
  }
}

fn param_required(spec: MethodSpec, json_key: String) -> Bool {
  list.any(spec.required, fn(item) { item.0 == json_key })
}

/// Build the full source text for a single schema file.
/// Build the full source text for one schema group: every schema of the
/// group becomes a custom type plus `<schema>_decoder` and
/// `<schema>_to_json`, followed by its field enums.
pub fn build_group_module(
  group: String,
  schemas: List(#(String, Schema)),
  groups: Dict(String, String),
) -> String {
  let deps =
    schemas
    |> list.flat_map(fn(item) { collect_refs(item.1) })
    |> list.filter(fn(dep) { dict.get(groups, dep) != Ok(group) })
    |> list.unique
    |> list.sort(by: string.compare)
  // One import per host module, collecting every type we share with it.
  // Unqualified type imports are never dropped by gleamgen and survive
  // type-position usage.
  let dep_hosts =
    list.fold(deps, dict.new(), fn(acc, dep) {
      let assert Ok(host) = dict.get(groups, dep)
      let current = case dict.get(acc, host) {
        Ok(existing) -> existing
        Error(Nil) -> []
      }
      dict.insert(acc, host, list.append(current, [dep]))
    })
  let host_imports =
    dict.to_list(dep_hosts)
    |> list.sort(by: fn(a, b) { string.compare(a.0, b.0) })
    |> list.map(fn(entry) {
      import_.new([
        "google_youtube_api_v3",
        "youtube",
        entry.0,
      ])
      |> import_.with_unqualified_items(list.map(
        entry.1,
        import_.unqualified_type,
      ))
    })
  let dict_needed =
    list.any(schemas, fn(item) {
      case item.1.kind {
        Object(properties:, ..) ->
          dict.values(properties) |> list.any(contains_object)
        _ -> False
      }
    })
  // Raw (unprefixed) enum specs first; then rename the ones whose type
  // name collides with a sibling enum inside this group.
  let props_raw = list.map(schemas, fn(item) { #(item.0, base_props(item.1)) })
  let colliding =
    list.flat_map(props_raw, fn(entry) {
      list.filter_map(entry.1, fn(prop) {
        case prop.3 {
          Some(spec) -> Ok(spec.type_name)
          None -> Error(Nil)
        }
      })
    })
    |> count_list
    |> dict.filter(fn(_key, count) { count > 1 })
    |> dict.to_list
    |> list.map(fn(entry) { entry.0 })
    |> set.from_list
  let props =
    list.map(props_raw, fn(entry) {
      let host = justin.pascal_case(entry.0)
      #(
        entry.0,
        list.map(entry.1, fn(prop) {
          #(prop.0, prop.1, prop.2, prefix_enum(prop.3, host, colliding))
        }),
      )
    })
  let items =
    list.zip(schemas, props)
    |> list.map(fn(pair) {
      let #(#(name, schema), #(_, schema_props)) = pair
      #(name, schema, schema_props)
    })
  let needs_option = list.any(items, fn(item) { !list.is_empty(item.2) })
  let decode_import =
    import_.new(["gleam", "dynamic", "decode"])
    |> import_.with_unqualified_items([import_.unqualified_type("Decoder")])
  let json_import =
    import_.new(["gleam", "json"])
    |> import_.with_unqualified_items([import_.unqualified_type("Json")])
  let dict_import =
    import_.new(["gleam", "dict"])
    |> import_.with_unqualified_items([import_.unqualified_type("Dict")])
  let option_import =
    import_.new(["gleam", "option"])
    |> import_.with_unqualified_items([import_.unqualified_type("Option")])
  let all_imports =
    list.flatten([
      [decode_import],
      [json_import],
      case dict_needed {
        True -> [dict_import]
        False -> []
      },
      case needs_option {
        True -> [option_import]
        False -> []
      },
      host_imports,
    ])

  module.with_module_documentation_comments([], fn() {
    use imported <- module.with_dynamic_imports(all_imports)
    let assert [decode_mod, json_mod, ..rest] = imported
    let #(dict_mods, rest2) =
      list.split(rest, case dict_needed {
        True -> 1
        False -> 0
      })
    let #(option_mods, host_mods) =
      list.split(rest2, case needs_option {
        True -> 1
        False -> 0
      })
    let dict_ref = case dict_mods {
      [dict_mod, ..] -> import_.import_to_reference(dict_mod)
      [] -> import_.import_to_reference(dict_import)
    }
    let option_ref = case option_mods {
      [option_mod, ..] -> import_.import_to_reference(option_mod)
      [] -> import_.import_to_reference(option_import)
    }
    // host_mods match host_imports in construction order; flatten each
    // host's dep list against its reference.
    let ref_lookup =
      list.zip(
        dict.to_list(dep_hosts)
          |> list.sort(by: fn(a, b) { string.compare(a.0, b.0) }),
        host_mods,
      )
      |> list.flat_map(fn(pair) {
        let #(entry, host_mod) = pair
        let host_ref = import_.import_to_reference(host_mod)
        list.map(entry.1, fn(dep) { #(dep, host_ref) })
      })
      |> dict.from_list
    let ctx =
      GroupCtx(
        decode_ref: import_.import_to_reference(decode_mod),
        json_ref: import_.import_to_reference(json_mod),
        dict_ref:,
        option_ref:,
        ref_lookup:,
      )
    with_schema_items(items, ctx, module.eof)
  })
  |> module.render(render.default_context())
  |> render.to_string()
  |> rendering.fix_empty_param_break()
}

/// Everything a group's decoder/encoder builders need.
type GroupCtx {
  GroupCtx(
    decode_ref: ImportReference,
    json_ref: ImportReference,
    dict_ref: ImportReference,
    option_ref: ImportReference,
    ref_lookup: Dict(String, ImportReference),
  )
}

/// Sorted properties of one schema, with raw enum specs.
fn base_props(
  schema: Schema,
) -> List(#(String, String, Schema, Option(EnumSpec))) {
  case schema.kind {
    Object(properties:, ..) ->
      properties
      |> sorted_properties
      |> list.map(fn(prop) {
        let #(json_key, prop_schema) = prop
        #(
          json_key,
          naming.sanitize_field(justin.snake_case(json_key)),
          prop_schema,
          property_enum(json_key, prop_schema),
        )
      })
    _ -> []
  }
}

/// Prefix an enum type name with its host schema when siblings collide.
/// Variant names follow the type, keeping them module-unique.
fn prefix_enum(
  base: Option(EnumSpec),
  host: String,
  colliding: Set(String),
) -> Option(EnumSpec) {
  case base {
    Some(spec) ->
      case set.contains(colliding, spec.type_name) {
        True -> {
          let type_name = justin.pascal_case(host) <> spec.type_name
          Some(EnumSpec(
            type_name:,
            to_string_name: justin.snake_case(type_name) <> "_to_string",
            decoder_name: justin.snake_case(type_name) <> "_decoder",
            variants: list.map(spec.variants, fn(v) {
              #(type_name <> naming.enum_variant_stem(v.1), v.1)
            }),
          ))
        }
        False -> base
      }
    None -> None
  }
}

/// Emit every schema in a group: type, decoder, encoder, field enums.
fn with_schema_items(
  items: List(
    #(String, Schema, List(#(String, String, Schema, Option(EnumSpec)))),
  ),
  ctx: GroupCtx,
  handler: fn() -> Module,
) -> Module {
  case items {
    [] -> handler()
    [#(name, schema, props), ..rest] -> {
      let snake = justin.snake_case(name)
      let fields =
        list.map(props, fn(prop) {
          let #(_, field_name, prop_schema, field_enum) = prop
          let inner =
            schema_to_type(
              prop_schema,
              ctx.ref_lookup,
              ctx.dict_ref,
              field_enum,
            )
          let wrapped =
            import_.raw_type(ctx.option_ref, "Option")
            |> custom.to_type1(inner)
            |> type_.to_dynamic
          #(Some(field_name), wrapped)
        })
      let details =
        definition.new(name)
        |> definition.with_publicity(True)
        |> rendering.with_description(schema.description)
      let variant =
        variant.new(name)
        |> variant.with_arguments_dynamic(fields)
      use _type, constructors <- module.with_custom_type_dynamic(
        details,
        custom.new_dynamic([variant], []),
      )
      use _decoder <- module.with_function(
        definition.new(snake <> "_decoder") |> definition.with_publicity(True),
        decoder_function(
          name,
          props,
          constructors,
          ctx.decode_ref,
          ctx.ref_lookup,
        ),
      )
      use _encoder <- module.with_function(
        definition.new(snake <> "_to_json") |> definition.with_publicity(True),
        encoder_function(name, props, ctx.json_ref, ctx.ref_lookup),
      )
      with_enums(
        list.filter_map(props, fn(prop) {
          case prop.3 {
            Some(spec) -> Ok(#(spec, prop.2.description))
            None -> Error(Nil)
          }
        }),
        ctx.decode_ref,
        fn() { with_schema_items(rest, ctx, handler) },
      )
    }
  }
}

/// Count occurrences of each distinct string.
fn count_list(items: List(String)) -> Dict(String, Int) {
  list.fold(items, dict.new(), fn(acc, item) {
    let count = case dict.get(acc, item) {
      Ok(n) -> n + 1
      Error(Nil) -> 1
    }
    dict.insert(acc, item, count)
  })
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
    list.fold(
      list.reverse(props),
      expression.call_dynamic(d("success"), [
        ctor_call,
      ]),
      fn(acc, prop) {
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
      },
    )
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
      let callee_name = justin.snake_case(name) <> "_decoder"
      let callee = case dict.get(ref_lookup, name) {
        // Qualified call through the sibling's type import:
        // `channel.channel_decoder()`.
        Ok(ref) ->
          expression.imported_ident(ref, callee_name) |> expression.to_dynamic
        // Same-group reference: the local function being defined.
        Error(Nil) -> expression.raw(callee_name) |> expression.to_dynamic
      }
      expression.call_dynamic(callee, [])
    }
    Object(properties:, additional:) -> {
      let value = case dict.is_empty(properties), additional {
        True, Some(extra) -> value_decoder(extra, decode_ref, ref_lookup, None)
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
          #(type_name <> naming.enum_variant_stem(value), value)
        }),
      ))
    }
    _ -> None
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
        |> rendering.with_description(description)
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
        case_.with_pattern(
          acc,
          pattern.from_constructor_dynamic(ctor, []),
          fn(_) { expression.string(original) },
        )
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
          expression.call_dynamic(d("success"), [
            expression.raw(variant_name) |> expression.to_dynamic,
          ])
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

/// Build the `to_json()` function: `json.object` of one entry per field,
/// each `json.nullable(value.field, <inner>)` so missing fields encode
/// as explicit nulls.
fn encoder_function(
  type_name: String,
  props: List(#(String, String, Schema, Option(EnumSpec))),
  json_ref: ImportReference,
  ref_lookup: Dict(String, ImportReference),
) -> function.Function(fn(type_.Dynamic) -> type_.Dynamic, type_.Dynamic) {
  let j = fn(name) {
    import_.raw_ident(json_ref, name) |> expression.to_dynamic
  }
  let value_param = case props {
    [] -> "_value"
    _ -> "value"
  }
  let entries =
    list.map(props, fn(prop) {
      let #(json_key, field_name, prop_schema, field_enum) = prop
      let field_access =
        expression.field(expression.raw(value_param), field_name)
        |> expression.to_dynamic
      expression.tuple2(
        expression.string(json_key) |> expression.to_dynamic,
        expression.call_dynamic(j("nullable"), [
          field_access,
          value_to_json_fn(prop_schema, json_ref, ref_lookup, field_enum),
        ]),
      )
      |> expression.to_dynamic
    })
  let body =
    expression.call_dynamic(j("object"), [
      case entries {
        [] -> expressions.empty_list()
        _ -> expression.list(entries) |> expression.to_dynamic
      },
    ])
  function.new1(
    param1: parameter.new(value_param, type_.raw(type_name) |> type_.to_dynamic),
    returns: import_.raw_type(json_ref, "Json")
      |> custom.to_type
      |> type_.to_dynamic,
    handler: fn(_) { body },
  )
}

/// A `fn(a) -> json.Json` expression encoding one (non-optional) value.
/// Either a direct function reference or a small closure.
fn value_to_json_fn(
  schema: Schema,
  json_ref: ImportReference,
  ref_lookup: Dict(String, ImportReference),
  field_enum: Option(EnumSpec),
) -> expression.Expression(type_.Dynamic) {
  let j = fn(name) {
    import_.raw_ident(json_ref, name) |> expression.to_dynamic
  }
  case schema.kind {
    Str(_, []) -> j("string")
    Str(_, [_, ..]) ->
      element_to_json_fn(schema, json_ref, ref_lookup, field_enum)
    Integer(_) -> j("int")
    Number -> j("float")
    Boolean -> j("bool")
    Any -> j("string")
    Array(items:) ->
      rendering.closure1(
        "items",
        expression.call_dynamic(j("array"), [
          expression.raw("items") |> expression.to_dynamic,
          element_to_json_fn(items, json_ref, ref_lookup, field_enum),
        ]),
      )
    Ref(name) -> {
      let callee_name = justin.snake_case(name) <> "_to_json"
      let callee = case dict.get(ref_lookup, name) {
        Ok(ref) ->
          expression.imported_ident(ref, callee_name) |> expression.to_dynamic
        Error(Nil) -> expression.raw(callee_name) |> expression.to_dynamic
      }
      callee
    }
    Object(properties:, additional:) -> {
      let #(key_fn, value_fn) = case dict.is_empty(properties), additional {
        True, Some(extra) -> #(
          rendering.closure1("k", expression.raw("k") |> expression.to_dynamic),
          element_to_json_fn(extra, json_ref, ref_lookup, None),
        )
        _, _ -> #(
          rendering.closure1("k", expression.raw("k") |> expression.to_dynamic),
          j("string"),
        )
      }
      rendering.closure1(
        "d",
        expression.call_dynamic(j("dict"), [
          expression.raw("d") |> expression.to_dynamic,
          key_fn,
          value_fn,
        ]),
      )
    }
  }
}

/// The element encoder inside arrays: primitives and sibling types are
/// direct references, enum elements need a closure.
fn element_to_json_fn(
  schema: Schema,
  json_ref: ImportReference,
  ref_lookup: Dict(String, ImportReference),
  field_enum: Option(EnumSpec),
) -> expression.Expression(type_.Dynamic) {
  case schema.kind, field_enum {
    Str(_, [_, ..]), Some(spec) -> {
      let j = fn(name) {
        import_.raw_ident(json_ref, name) |> expression.to_dynamic
      }
      rendering.closure1(
        "e",
        expression.call_dynamic(j("string"), [
          expression.call_dynamic(
            expression.raw(spec.to_string_name) |> expression.to_dynamic,
            [expression.raw("e") |> expression.to_dynamic],
          ),
        ]),
      )
    }
    _, _ -> value_to_json_fn(schema, json_ref, ref_lookup, None)
  }
}

/// Gleam keywords can't be used as labelled-argument names. Decoder helper
/// names are also reserved so field bindings never shadow them in generated
/// `decoder()` bodies.
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
