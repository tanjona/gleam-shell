import gleam/list
import gleam/string

pub type Command {
  Exit
  Unknow
}

pub fn line_to_cmd(raw_line: String) -> Result(Command, String) {
  let words = string.split(raw_line, " ")
  case words {
    ["exit", ..] -> Ok(Exit)
    __ -> Error(raw_line <> ": command not found")
  }
}
