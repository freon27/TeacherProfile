Feature: Experience Page

  As a profile owner
  In order to show my experience 
  I want to be able to edit my experience page
  
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
    When I press "Edit"
    Then I should see "Experience" within "#profile-sidebar"
    When I follow "Experience"
    Then I should see "No positions listed"
    When I press "Add Position"
    And I fill in "Location" with "School A"
