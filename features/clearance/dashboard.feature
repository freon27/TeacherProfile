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
		When I fill in "Profile URL" with "profilea"
    And press "Create"
    Then I should see "Profile A" within "td"
    
  Scenario: Too many accounts
    Given the following user exists:
    | email            | password   |
    | email@person.com | Password1  |
    And the following profiles exist:
    | name       | user                     |
    | Profile A  | email: email@person.com  |
    | Profile B  | email: email@person.com  |
    | Profile C  | email: email@person.com  |
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    Then I should not see a "Create" button
    

  Scenario: Profile actions
    Given the following user exists:
    | email            | password   |
    | email@person.com | Password1  |
    And the following profiles exist:
    | name       | user                     |
    | Profile A  | email: email@person.com  |
    | Profile B  | email: email@person.com  |
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    When I follow "Edit"
    Then I should see "Edit Profile"