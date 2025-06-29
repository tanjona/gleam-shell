import gleam/string

pub type Command {
  Exit
  Help
}

pub fn string_to_command(raw: String) -> Result(Command, String) {
  case raw {
    "exit" -> Ok(Exit)
    _ -> Error(raw <> ": command not found")
  }
}

pub fn line_to_cmd(raw_line: String) -> Result(Command, String) {
  let words = string.split(raw_line, " ")
  case words {
    [command, ..] -> string_to_command(command)
    [] -> Error("Emppty line")
  }
}
