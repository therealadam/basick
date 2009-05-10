Feature: PRINT
  Programs that do some kind of IO are, in general, more useful than those that don't. Therefore, Basick should support limited IO.
  
  Scenario: simple print
    Given a program
      """
      PRINT "HI"
      """
    Then the program should parse
    And the output is 'HI'
