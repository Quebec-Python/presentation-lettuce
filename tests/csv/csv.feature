Feature: Convert to CSV
    In order to export contacts
    As a user
    I shall convert contacts into CSV format

    Scenario: Convert contacts to csv
        Given I have the following contacts:
            | title     | first name | last name | ship                    |
            | Captain   | James      | Kirk      | U.S.S Enterprise D      |
            | Captain   | Jean-Luc   | Picard    | U.S.S Enterprise E      |
            | Commander | William    | Riker     | U.S.S Enterprise E      |
            | Engineer  | Montgomery | Scotty    | Enterprise, Dear Lass ! |
        When I convert them to csv
        Then I get the following lines:
            | line                                                       |
            | "Captain","James","Kirk","U.S.S Enterprise D"              |
            | "Captain","Jean-Luc","Picard","U.S.S Enterprise E"         |
            | "Commander","William","Riker","U.S.S Enterprise E"         |
            | "Engineer","Montgomery","Scotty","Enterprise, Dear Lass !" |
