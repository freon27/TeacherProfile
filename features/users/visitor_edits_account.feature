Feature: Edit Account

  In order to keep my details up to date
  As a user
  I want to update my details

  Scenario: Valid details
    Given I am signed up as "email@person.com/Password1"
    When I sign in as "email@person.com/Password1"
    Then I should be signed in
    And I should see "Account"
    When I follow "Account"
    Then I should see "Editing your account"
    When I fill in "First name" with "Test"
    And I fill in "Last name" with "User"
    And I fill in "Email" with "blah@blah.com"
    And I press "Save"
    Then I should see "Your account was saved successfully"

  Scenario: Invalid details
    Given I am signed up as "email@person.com/Password1"
    When I sign in as "email@person.com/Password1"
    Then I should be signed in
    And I should see "Account"
    When I follow "Account"
    Then I should see "Editing your account"
    When I fill in "First name" with ""
    And I fill in "Last name" with ""
    And I fill in "Email" with ""
    And I press "Save"
    Then I should see "can't be blank"
