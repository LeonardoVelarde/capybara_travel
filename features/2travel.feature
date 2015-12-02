Feature: Mercury Tours Verify Registration

Background:
    Given the Mercury Tours homepage

Scenario: Register a user on site
	And I click the "Register" link
	When I enter the required fields as show below
	|First Name: 	    | Pepito             |
    |Last Name: 	    | Perez              |
    |Phone: 	        | 1234-567-12        |
    |Email: 	        | pepe@pepazo.com    |
    |Address:           | Av. America #123   |
    |City: 	            | Cochabamba         |
    |State/Province:    | Cochabamba         |
    |Postal Code: 	    | 9897               |
    |Country: 	        | BOLIVIA            |
    |User Name: 	    | Pepazo             |
    |Password:          | ILoveQA            |
    |Confirm Password:  | ILoveQA            |
	And send my registration form
	Then the confirmation screen is show
	And my user name is "Pepazo"

Scenario: Find a flight with a register suer
    And i enter my username and password
    When i press the "login" button
    Then the Flight Finder screen is show

Scenario: Log in from sing in base
    Given Mercury sing on page
    When i enter my username and password
    And i press the "login" button
    Then the Flight Finder screen is show