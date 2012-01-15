Feature: Dashboard

  In order to see the status of my profiles "at a glance"
  As a visitor
  I want to be shown a dashboard view of my account
  
  Scenario: Logs in for the first time
    Given I am signed up as "email@person.com/Password1"
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    Then I should see "Lets create your first teaching profile!"
    When I follow "Create profile"
    Then I should see "Create Profile"
    When I fill in "Name" with "Profile A"
		And I fill in "Profile URL" with "profile A"
		And I select "Science" from "Main subject"
		And I attach the file "spec/files/test.png" to "Photo"
    And press "Create"
    Then I should see "Profile A" within "td"
    
  Scenario: Too many accounts
		Given a user exists with email: "email@person.com", password: "Password1" 
    And the following profiles exist:
    | name       | user           |
    | Profile A  | the first user |
    | Profile B  | the first user |
    | Profile C  | the first user |
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    Then I should not see a "Create" button
    

  Scenario: Profile actions
		Given a user exists with email: "email@person.com", password: "Password1" 
	  And the following profiles exist:
	  | name       | user           |
	  | Profile A  | the first user |
	  | Profile B  | the first user |
	  | Profile C  | the first user |
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    When I follow "Edit"
    Then I should see "Edit Profile"