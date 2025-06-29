import gleam/list
import gleam/string

pub type Command {
  Exit
  Echo(args: List(String))
  Type(arg: Result(String, Nil))
  Help
}

pub fn string_to_command(
  raw: String,
  args: List(String),
) -> Result(Command, String) {
  case raw {
    "exit" -> Ok(Exit)
    "echo" -> Ok(Echo(args))
    "type" -> Ok(Type(list.first(args)))
    _ -> Error(raw <> ": command not found")
  }
}

pub fn line_to_cmd(raw_line: String) -> Result(Command, String) {
  let words = string.split(raw_line, " ")
  case words {
    [command, ..args] -> string_to_command(command, args)
    [] -> Error("Emppty line")
  }
}
