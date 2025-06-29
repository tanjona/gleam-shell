import gleam/io
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

pub fn apply(cmd: cmd.Command) {
  let _ = case cmd {
    cmd.Exit -> exit()
    cmd.Echo(args) -> exec_echo(args)
    cmd.Help -> io.print("usage: exit 0")
  }
}
