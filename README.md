# Logicalc

This little language aims at implementing some first order logic calculations. We'll see if we can!
For now it implements: conjunction, disjunction, implication and negation.

## Example
logicalc>> NOT true
false
logicalc>> NOT NOT true
true
logicalc>> NOT true <-> false
true
logicalc>> false OR (true AND false)
false
logicalc>> NOT (true AND false) -> true
false
logicalc>> NOT (true OR false) -> false
true