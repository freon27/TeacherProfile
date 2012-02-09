Feature: Sign out

  In order to cease using my account
  As a signed in user
  I want to delete my account

  Scenario: User deletes account
    Given I am signed up as "email@example.com"
    When I sign in as "email@example.com"
    And I follow "Account"
		And I press "Delete Account"
