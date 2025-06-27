import execution/runner
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
    Ok(cmd) ->
      cmd.line_to_cmd(string.trim(cmd))
      |> result.map(fn(cmd) { runner.matcher(cmd) })
    _ -> Error("No line found!")
  }
  shell()
}
