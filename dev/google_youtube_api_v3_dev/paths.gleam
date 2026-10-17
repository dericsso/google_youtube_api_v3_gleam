import gleam/list
import gleam/string
import gleamgen/expression
import gleamgen/type_
import google_youtube_api_v3_dev/naming
import justin

pub fn path_expr(path: String) -> expression.Expression(type_.Dynamic) {
  let parts = parse_path_template(path)
  let exprs =
    list.map(parts, fn(part) {
      case part {
        #(False, literal) -> expression.string(literal)
        #(True, name) ->
          access_field("params", naming.sanitize_field(justin.snake_case(name)))
          |> expression.coerce_dynamic_unsafe
      }
    })
  case exprs {
    [] -> expression.string("")
    [first, ..rest] ->
      list.fold(rest, first, fn(acc, part) {
        expression.concat_string(acc, part)
      })
  }
  |> expression.to_dynamic
}

fn parse_path_template(path: String) -> List(#(Bool, String)) {
  case string.split(path, on: "{") {
    [] -> []
    [head, ..tail] -> {
      let parts =
        list.flat_map(tail, fn(chunk) {
          case string.split_once(chunk, on: "}") {
            Ok(#(var, after)) -> [#(True, var), #(False, after)]
            Error(Nil) -> [#(False, "{" <> chunk)]
          }
        })
      [#(False, head), ..parts]
      |> list.filter(fn(part) { part.1 != "" || part.0 })
    }
  }
}

fn access_field(
  record: String,
  field: String,
) -> expression.Expression(type_.Dynamic) {
  expression.field(expression.raw(record), field) |> expression.to_dynamic
}
