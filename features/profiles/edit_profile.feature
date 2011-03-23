Feature: Profile

  In order to set up my profile
  As a profile owner
  I want to be able to edit my profile
  
  Background:
    Given the following user exists:
    | email            | password   |
    | email@person.com | Password1  |
    And the following profiles exist:
    | name       | user                     |
    | Profile A  | email: email@person.com  |
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    Then I should see an "Edit" button
    

  Scenario: Edit profile
    When I press "Edit"  

  Scenario: Edit profile links
    When I press "Edit"
