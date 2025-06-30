type expression =
  | Bool of bool
  | Conjunction of expression * expression
  | Disjunction of expression * expression
  | Implication of expression * expression
  | Negation of expression