
(* The type of tokens. *)

type token = 
  | TRUE of (bool)
  | RPAREN
  | OR
  | NOT
  | LPAREN
  | IMPL
  | FALSE of (bool)
  | EOF
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Syntax.expression)
