Feature: View Profile

	In order to set up my profile
	As a profile owner
	I want to be able to view my profile
	And I want other people to be able to view it

	Scenario: Viewing a profile I own
	Given a user exists with email: "test@test.com"
	And a completed profile exists with user: the user
	And I sign in as "test@test.com/Password1"
	And I am on the completed profile's page
	Then I should see "First Last"
	And I should see "Design & Technology Teacher"
	And I should see "Edit this profile"
	
	Scenario: Viewing a profile without being logged in
	Given a completed profile exists
	Then I should be signed out
	And I am on the completed profile's page
	Then I should see "First Last"
	And I should see "Design & Technology Teacher"
	And I should not see "Edit this profile"
	
	