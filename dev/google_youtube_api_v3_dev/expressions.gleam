import gleam/option.{type Option}
import gleamgen/expression
import gleamgen/import_.{type ImportReference}
import gleamgen/type_

pub fn empty_list() -> expression.Expression(type_.Dynamic) {
  expression.raw("[]") |> expression.to_dynamic
}

pub fn raw(name: String) -> expression.Expression(type_.Dynamic) {
  expression.raw(name) |> expression.to_dynamic
}

pub fn access_field(
  record: String,
  field: String,
) -> expression.Expression(type_.Dynamic) {
  expression.field(expression.raw(record), field) |> expression.to_dynamic
}

pub fn qualified(
  ref: ImportReference,
  name: String,
) -> expression.Expression(type_.Dynamic) {
  expression.imported_ident(ref, name) |> expression.to_dynamic
}

pub fn option_subject(
  value: expression.Expression(type_.Dynamic),
) -> expression.Expression(Option(a)) {
  expression.coerce_dynamic_unsafe(value)
}

pub fn some(
  value: expression.Expression(type_.Dynamic),
) -> expression.Expression(type_.Dynamic) {
  expression.option_some(value) |> expression.to_dynamic
}
