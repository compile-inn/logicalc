%{
    open Syntax
%}

%token <bool> TRUE
%token <bool> FALSE
%token AND
%token OR
%token IMPL
%token EQUIV
%token NOT
%token LPAREN
%token RPAREN
%token EOF

%nonassoc NOT
%left AND OR IMPL EQUIV

%start <Syntax.expression> prog

%%

prog:
   | e = expression; EOF { e }

expression:
   | TRUE { Bool true }
   | FALSE { Bool false }
   | e1 = expression; AND; e2 = expression { Conjunction (e1, e2) }
   | e1 = expression; OR; e2 = expression { Disjunction (e1, e2) }
   | e1 = expression; IMPL; e2 = expression { Implication (e1, e2) }
   | e1 = expression; EQUIV; e2 = expression { Equivalence (e1, e2)}
   | NOT; e1 = expression { Negation e1 }
   | LPAREN; e = expression; RPAREN { e }