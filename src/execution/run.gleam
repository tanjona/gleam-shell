import gleam/io
import parser/cmd

@external(erlang, "erlang", "halt")
pub fn halt(status: Int) -> Nil

pub fn exit() {
  halt(0)
}

pub fn apply(cmd: cmd.Command) {
  let _ = case cmd {
    cmd.Exit -> exit()
    cmd.Help -> io.print("usage: exit 0")
  }
}
