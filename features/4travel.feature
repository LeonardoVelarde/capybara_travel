Feature: Mercury Tours verify flight booker

  Background:
    Given Mercury sing on page
    And i enter my username and password
    And i press the "login" button
    And i fill fields of flight finder
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
    Then i book a flight page is shown

#    Scenario: Select flights to book
#      When i select a flight
#      | Airline      | Pangea Airlines |
#      | FlightNumber |       632       |
#      | price        |       282       |
#      | departure    |      16:37      |
#      And i select a flight
#      | Airline      | Pangea Airlines |
#      | FlightNumber |       362       |
#      | price        |       274       |
#      | departure    |      9:17       |
#      And i press the "reserveFlights" button
#      Then i book a flight page is shown
#      And the selected flight is show
#      | Airline      | Pangea Airlines |
#      | FlightNumber |       632       |
#      | price        |       282       |
#      And the selected flight is show
#      | Airline      | Pangea Airlines |
#      | FlightNumber |       362       |
#      | price        |       274       |

    Scenario: Book a flight
      When i select a flight
        | Airline      | Pangea Airlines |
        | FlightNumber |       632       |
        | price        |       282       |
        | departure    |      16:37      |
      And i select a flight
        | Airline      | Pangea Airlines |
        | FlightNumber |       362       |
        | price        |       274       |
        | departure    |      9:17       |
      And i press the "reserveFlights" button
      When form for both passengers is filled
      | passFirst0 | Juan |
      | passFirst1 | Juana |
      | passLast0 | ILoveQA |
      | passLast1 | ILoveQA |
      | pass.0.meal | Kosher |
      | pass.1.meal | Hindu |
      | creditCard | Visa |
      | cc_frst_name | Juan |
      | cc_mid_name | Marcos |
      | cc_last_name | ILoveQA |
      | creditnumber | 123456789 |
      | cc_exp_dt_mn | 05 |
      | cc_exp_dt_yr | 2010 |
      | billAddress1 | Av.America 615 |
      | billCity | Cochabamba |
      | billState | CO |
      | billZip | 12345 |
      | billCountry | BOLIVIA |
      | delAddress1 | Av.America 615 |
      | delCity | Cochabamba |
      | delState | CO |
      | delZip | 12345 |
      | delCountry | BOLIVIA |
      And i press the "buyFlights" button
      Then confirmation for booked flight should be shown
