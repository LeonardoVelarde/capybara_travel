Feature: Guru99 Demo Page

@maximize
Scenario: Register on Guru99 page without email        
	Given I am on the Guru99 homepage
	When I enter blank details for Register
	And Press the "Submit" button
	Then error "Email ID must not be blank" is show


@maximize
Scenario: Register on Guru99 page with a valid email        
    Given I am on the Guru99 homepage
	When I enter "carlos@test.com" for Register
    And Press the "Submit" button
	Then I should see the following table:
      | User ID	     |  mngr23537  |
 	  | Password     |  Ypegaza    | 
	  