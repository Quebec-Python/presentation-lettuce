Feature: Compute factorial
    In order to show how Lettuce works
    As a programmer
    We shall implement a factorial method

    Scenario: Factorial of 0
        Given I have the number "0"
        When I compute its factorial
        Then I see the number "1"
