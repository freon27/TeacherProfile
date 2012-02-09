Feature: Subject Area 

  As a profile owner
  In order to show my sample work 
  I want to be able to display documents for a subject area
  
  Background:
   Given a user exists with email: "email@person.com", password: "Password1"	
	 And profile exists with name: "Profile A", user: the first user
   And I go to the sign in page
   And I sign in with "email@person.com" and "Password1"
	 And I am on the profile edit page
	  
	Scenario: Creating a subject area with valid data
    When I follow "Sample Work"
		Then I should see "Sample Work"
		And I should see "You currently don't have any subject areas listed"
		When I follow "Add a subject area"
		Then I should see "New Subject Area"
		When I fill in "Name" with "Systems and Control"
		And I press "Create"
		Then I should see "Created" within "#flash_notice"
		And I should see "Systems and Control" within "table.subject-area"
		And I should not see "You currently don't have any subject areas listed"

	Scenario: Creating a subject area with invalid data
	  When I follow "Sample Work"
		Then I should see "Sample Work"
		And I should see "You currently don't have any subject areas listed"
		When I follow "Add a subject area"
		Then I should see "New Subject Area"
		When I press "Create"
		Then I should see "can't be blank"
		
	Scenario: Deleting subject area 
	  When I follow "Sample Work"
		Then I should see "Sample Work"
		When I follow "Add a subject area"
		And I fill in "Name" with "Systems and Control"
		And I press "Create"
		When I follow "Delete" 
		Then I should see "Deleted"
		And I should not see "Systems and Control"		
		
	Scenario: Editing subject area
		When I follow "Sample Work"
		Then I should see "Sample Work"
		When I follow "Add a subject area"
		And I fill in "Name" with "Systems and Control"
		And I press "Create"
		When I follow "Edit"
		And I fill in "Name" with "Resistant Materials"
		And I press "Update"
		Then I should see "Saved"
		And the "Name" field should equal "Resistant Materials"
		
		
			