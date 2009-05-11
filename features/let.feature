Feature: LET
  Programs with assignment, while hard to debug, are easier to write for many
  people. Therefore, Basick should support assignment.
  
  Scenario: simple let
    Given a program
      """
      LET a := 4 + 4
      LET b := 5 + 5
      """
    Then the program should parse
    And the value of "a" is "8"
    And the value of "b" is "10"
    