Feature: Change password

  In order to keep my password secure
  As a user
  I want to change my password

  Scenario: Valid details
    Given I am signed up as "email@person.com/Password1"
    When I sign in as "email@person.com/Password1"
    When I follow "Edit Account"
    Then I should see "Change Password"
    When I follow "Change Password"
    And I fill in "Choose password" with "NewPassword1"
    And I fill in "Confirm password" with "NewPassword1"
    And I press "Save"
    Then I should see "Password updated"

  Scenario: Mismatched/invalid passwords
    Given I am signed up as "email@person.com/Password1"
    When I sign in as "email@person.com/Password1"
    When I follow "Edit Account"
    Then I should see "Change Password"
    When I follow "Change Password"
    And I fill in "Choose password" with "dsfsdf"
    And I fill in "Confirm password" with "dsksdsfsdf"
    And I press "Save"
    Then I should see "Password doesn't match confirmation"
    And I should see "Password is invalid"
