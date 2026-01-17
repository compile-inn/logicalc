# Logicalc

This little language aims at implementing some first order logic calculations. We'll see if we can!
For now it implements: conjunction, disjunction, implication and negation.

## Example
logicalc>> NOT true<br>
false<br>
logicalc>> NOT NOT true<br>
true<br>
logicalc>> NOT true <-> false<br>
true<br>
logicalc>> false OR (true AND false)<br>
false<br>
logicalc>> NOT (true AND false) -> true<br>
false<br>
logicalc>> NOT (true OR false) -> false<br>
true<br>
logicalc>> NOT (true OR false) <-> (NOT true) AND (NOT false)<br>
true<br>