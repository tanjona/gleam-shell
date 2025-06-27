import gleam/erlang
import gleam/io
import gleam/string

pub fn main() {
  shell()
}

fn shell() {
  case erlang.get_line("$ ") {
    Ok(cmd) -> io.println(string.trim(cmd) <> ": command not found")
    _ -> io.println("command not found")
  }
  shell()
}
