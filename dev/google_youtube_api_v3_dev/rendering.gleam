import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string
import gleamgen/expression
import gleamgen/function
import gleamgen/module/definition.{type Definition}
import gleamgen/parameter
import gleamgen/type_
import simplifile.{type FileError}

pub fn closure1(
  param_name: String,
  body: expression.Expression(type_.Dynamic),
) -> expression.Expression(type_.Dynamic) {
  function.new1(
    param1: parameter.new(param_name, type_.dynamic() |> type_.to_dynamic),
    returns: type_.dynamic() |> type_.to_dynamic,
    handler: fn(_) { body },
  )
  |> function.anonymous
  |> expression.to_dynamic
}

pub fn with_description(
  details: Definition,
  description: Option(String),
) -> Definition {
  case description {
    Some(doc) -> definition.with_documentation_comments(details, [doc])
    None -> details
  }
}

pub fn fix_empty_param_break(code: String) -> String {
  code
  |> string.replace("(\n  ,\n)", "()")
  |> string.replace("(\n    ,\n  )", "()")
}

pub fn initialize_directory(directory_path: String) -> Result(Nil, FileError) {
  use res <- result.try(simplifile.exists(directory_path, False))
  let res = case res {
    True -> Ok(Nil)
    False -> simplifile.create_directory(directory_path)
  }
  use _ <- result.try(res)
  simplifile.clear_directory(directory_path)
}
