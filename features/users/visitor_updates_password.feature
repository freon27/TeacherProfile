Feature: Change password

  In order to keep my password secure
  As a user
  I want to change my password

  Scenario: Valid details
    Given I am signed up as "email@example.com"
    When I sign in as "email@example.com"
    When I follow "Account"
    Then I should see "Change Password"
    When I follow "Change Password"
    And I fill in "Choose password" with "NewPassword1"
    And I press "Save"
    Then I should see "Password updated"

