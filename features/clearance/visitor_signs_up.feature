Feature: Sign up

  In order to get access to protected sections of the site
  As a visitor
  I want to sign up

  Scenario: Visitor signs up with invalid data
    When I go to the sign up page
    And I fill in "Email" with "invalidemail"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with ""
    And I press "Sign up"
    Then I should see error messages

  Scenario: Visitor signs up with valid data
    When I go to the sign up page
    And I fill in "Email" with "email@person.com"
    And I fill in "First name" with "Test"
    And I fill in "Last name" with "User"
    And I fill in "Password" with "Password1"
    And I fill in "Password confirmation" with "Password1"
    And I press "Sign up"
    Then I should see "Welcome"
