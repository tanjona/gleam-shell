import gleam/erlang/process
import gleam/io
import parser/cmd

@external(erlang, "erlang", "halt")
pub fn halt(status: Int) -> Nil

pub fn exit() {
  halt(0)
}

pub fn matcher(cmd: cmd.Command) {
  let _ = case cmd {
    cmd.Exit -> exit()
    _ -> io.print("command not found")
  }
}
