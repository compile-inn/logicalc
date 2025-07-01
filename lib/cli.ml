open Syntax

let rec eval = function
  | Bool b -> if b = true then true else false
  | Conjunction (e1, e2) -> if (eval e1 && eval e2) then true else false
  | Disjunction (e1, e2) -> if (eval e1 || eval e2) then true else false
  | Negation e -> if eval e then false else true
  | Implication (e1, e2) -> if (eval e1 && not (eval e2)) then false else true
  | Equivalence (e1, e2) -> if eval e1 = eval e2 then true else false

let bool_to_string b = if b then "true" else "false" 

let info = Cmdliner.Cmd.info "logicalc"

let eval_lb lb =
  try
    let expr = Parser.prog Lexer.token lb in
    let b = eval expr in
    Printf.printf "%s\n" (bool_to_string b)
  with Parser.Error ->
    Printf.printf "parse error near character %d" lb.lex_curr_pos

let repl () =
  while true do
    Printf.printf "logicalc>> %!";
    let lb = Lexing.from_channel Stdlib.stdin in
    eval_lb lb
  done

let term =
  let open Cmdliner.Term.Syntax in
  let+ expr_opt =
    let open Cmdliner.Arg in
    value & opt (some string) None & info [ "e" ]
  in
  match expr_opt with
  | Some s -> eval_lb (Lexing.from_string s)
  | None -> repl ()

let cmd = Cmdliner.Cmd.v info term
let main () = Cmdliner.Cmd.eval cmd |> Stdlib.exit