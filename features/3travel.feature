Feature: Mercury Tours verify flight finder

  Background:
    Given Mercury sing on page
    And i enter my username and password
    And i press the "login" button

  Scenario: find flights for round trip
    When i fill fields of flight finder
    |  tripType    |     roundtrip     |
    |  passCount   |         2         |
    |  fromPort    |     Frankfurt     |
    |  fromMonth   |      January      |
    |   fromDay    |         15        |
    |  toPort      |      New York     |
    |  toMonth     |      January      |
    |   toDay      |         20        |
    |  servClass   |     Business      |
    |  airline     | Unified Airlines  |
    And i press the "findFlights" button
    Then the select Flight page is shown with departure and return

  Scenario: find flights for one way trip
    When i fill fields of flight finder
      |  tripType    |       oneway      |
      |  passCount   |         2         |
      |  fromPort    |     Frankfurt     |
      |  fromMonth   |      January      |
      |   fromDay    |         15        |
      |  toPort      |      New York     |
      |  toMonth     |      January      |
      |   toDay      |         20        |
      |  servClass   |     Business      |
      |  airline     | Unified Airlines  |
    And i press the "findFlights" button
    Then the select Flight page is shown with only departure
