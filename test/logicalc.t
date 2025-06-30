  $ logicalc -e 'true AND true'
  true

  $ logicalc -e 'false AND true'
  false

  $ logicalc -e 'true OR false'
  true

  $ logicalc -e 'true -> false'
  false

  $ logicalc -e 'NOT true OR true'
  false

  $ logicalc -e 'NOT (true OR true)'
  logicalc: internal error, uncaught exception:
            Failure("lexing: empty token")
            
  [125]

