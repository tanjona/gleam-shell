import execution/run
import gleam/erlang
import gleam/io
import gleam/result
import gleam/string
import parser/cmd

pub fn main() {
  shell()
}

fn shell() {
  let _ = case erlang.get_line("$ ") {
    Ok(line) ->
      cmd.line_to_cmd(string.trim(line))
      |> result.map_error(fn(str) { io.println(str) })
      |> result.map(fn(cmd) { run.apply(cmd) })
    Error(_) -> Error(Nil)
  }
  shell()
}
