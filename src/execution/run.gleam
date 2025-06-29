import gleam/io
import gleam/result
import gleam/string
import parser/cmd

@external(erlang, "erlang", "halt")
pub fn halt(status: Int) -> Nil

pub fn exit() {
  halt(0)
}

pub fn exec_echo(args: List(String)) {
  io.println(string.join(args, " "))
}

pub fn exec_type(maybe_args: Result(String, Nil)) {
  case maybe_args {
    Ok(arg) ->
      cmd.string_to_command(arg, [])
      |> result.map(fn(_) { io.println(arg <> " is a shell builtin") })
      |> result.map_error(fn(_) { io.println(arg <> ": not found") })
      |> result.unwrap_both
    _ -> Nil
  }
}

pub fn apply(cmd: cmd.Command) {
  let _ = case cmd {
    cmd.Exit -> exit()
    cmd.Echo(args) -> exec_echo(args)
    cmd.Type(result) -> exec_type(result)
    cmd.Help -> io.print("usage: exit 0")
  }
}
