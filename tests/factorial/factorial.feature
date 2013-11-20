Feature: Compute factorial
    In order to show how Lettuce works
    As a programmer
    We shall implement a factorial method

    Scenario: Factorial of 0
        Given I have the number "0"
        When I compute its factorial
        Then I see the number "1"

    Scenario: Factorial of 1
        Given I have the number "1"
        When I compute its factorial
        Then I see the number "1"

    Scenario: Factorial of 4
        Given I have the number "4"
        When I compute its factorial
        Then I see the number "24"

    Scenario Outline: Factorials from 0 to 4
        Given I have the number "<number>"
        When I compute its factorial
        Then I see the number "<result>"

    Examples:
        | number | result |
        | 0      | 1      |
        | 1      | 1      |
        | 2      | 2      |
        | 3      | 6      |
        | 4      | 24     |
