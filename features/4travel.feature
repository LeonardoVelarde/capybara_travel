Feature: Mercury Tours verify flight booker

#  Background:
#    Given Mercury sing on page
#    And i enter my username and password
#    And i press the "login" button
#    And i fill fields of flight finder
#      |  tripType    |     roundtrip     |
#      |  passCount   |         2         |
#      |  fromPort    |     Frankfurt     |
#      |  fromMonth   |      January      |
#      |   fromDay    |         15        |
#      |  toPort      |      New York     |
#      |  toMonth     |      January      |
#      |   toDay      |         20        |
#      |  servClass   |     Business      |
#      |  airline     | Unified Airlines  |
#    And i press the "findFlights" button
#    Then i book a flight page is shown
#
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
#
#    Scenario: Book a flight
#      When i select a flight
#        | Airline      | Pangea Airlines |
#        | FlightNumber |       632       |
#        | price        |       282       |
#        | departure    |      16:37      |
#      And i select a flight
#        | Airline      | Pangea Airlines |
#        | FlightNumber |       362       |
#        | price        |       274       |
#        | departure    |      9:17       |
#      And i press the "reserveFlights" button
#      When form for both passengers is filled
#        | First Passenger Name               | Juan           |
#        | Second Passenger Name              | Juana          |
#        | First Passenger Last Name          | ILoveQA        |
#        | Second Passenger Last Name         | ILoveQA        |
#        | First Passenger Meal               | Kosher         |
#        | Second Passenger Meal              | Hindu          |
#        | Credit Card                        | Visa           |
#        | Credit Card Owner First Name       | Juan           |
#        | Credit Card Owner Middle Name      | Marcos         |
#        | Credit Card Owner Last Name        | ILoveQA        |
#        | Credit Card Number                 | 123456789      |
#        | Credit Card expiration date month  | 05             |
#        | Credit Card expiration date year   | 2010           |
#        | Billing Address                    | Av.America 615 |
#        | Billing City                       | Cochabamba     |
#        | Billing State                      | CO             |
#        | Billing Zip Code                   | 12345          |
#        | Billing Country                    | BOLIVIA        |
#        | Delivery Address                   | Av.America 615 |
#        | Delivery City                      | Cochabamba     |
#        | Delivery State                     | CO             |
#        | Delivery Zip Code                  | 12345          |
#        | Delivery Country                   | BOLIVIA        |
#      And i press the "buyFlights" button
#      Then confirmation for booked flight should be shown

  Scenario: First survey
    Given: the first survey page
    When: i fill all the questions
    Then: i end the survey
