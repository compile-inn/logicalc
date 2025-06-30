{
    open Parser
}

let space = [' ' '\r' '\t']+

rule token =
   parse
   | space { token lexbuf }
   | '\n' { EOF }
   | "true" { TRUE true }
   | "false" { FALSE false }
   | "AND" { AND }
   | "OR" { OR }
   | "->" { IMPL }
   | "NOT" { NOT }
   | eof { EOF }