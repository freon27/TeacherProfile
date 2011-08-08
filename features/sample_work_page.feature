Feature: Sample Work Page

  As a profile owner
  In order to show my sample work 
  I want to be able to edit my sample work page
  
  Background:
  Given a user exists with email: "email@person.com", password: "Password1"	
	And profile exists with name: "Profile A", user: the first user
  And I go to the sign in page
  And I sign in as "email@person.com/Password1"
	And I am on the profile edit page
  
	Scenario: Creating a position with valid data
    When I follow "Sample Work"
		Then I should see "Sample Work"
		And I should see "You currently don't have any subject areas listed"
		When I follow "Add a subject area"
