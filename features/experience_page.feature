Feature: Experience Page

  As a profile owner
  In order to show my experience 
  I want to be able to edit my experience page
  
  Background:
    Given a user exists with email: "email@person.com", password: "Password1"	
 		And profile exists with name: "Profile A", user: the first user
		
  Scenario: Creating a position with valid data
    When I go to the sign in page
    And I sign in with "email@person.com" and "Password1"
    When I follow "Edit"
    Then I should see "Experience" within ".sidebar"
    When I follow "Experience"
    Then I should see "You don't currently have any previous experience listed."
    When I follow "Add Position"
    And I fill in "Location" with "School A"
    And I fill in "Position type" with "School A"
    And I fill in "Date from" with "19/03/2006"  
		And I fill in "Description" with "My first sample placement"
    And I press "Create Position"
    Then I should see "Created"
		And I should see "School A" within "table.experience-table"

  Scenario: Creating a position with invalid data
    When I go to the sign in page
    And I sign in with "email@person.com" and "Password1"
    When I follow "Edit"
    Then I should see "Experience" within ".sidebar"
    When I follow "Experience"
    Then I should see "You don't currently have any previous experience listed."
    When I follow "Add Position"
    And I fill in "Location" with "School A"
    And I press "Create Position"
    Then I should see "can't be blank"
	
	
	
  Scenario: Editing a position
		When I go to the sign in page
	  And I sign in with "email@person.com" and "Password1"
	  When I follow "Edit"
	  Then I should see "Experience" within ".sidebar"
	  When I follow "Experience"
	  When I follow "Add Position"
	  And I fill in "Location" with "School A"
	  And I fill in "Position type" with "School A"
    And I fill in "Date from" with "19/03/2006"
    And I fill in "Date to" with "19/03/2008"  
		And I fill in "Description" with "My first sample placement"
	  And I press "Create Position"
	  Then I should see "Created"
		And I should see "School A" within "table.experience-table"
		When I follow "Edit" within "table.experience-table"
		And I fill in "Position type" with "Full time"
		When I press "Update Position" 
		Then I should see "Saved"
		When I follow "Delete" within "table.experience-table"
		Then I should see "Deleted"
		And I should not see "School A"
		
		
  Scenario: Editing a qualification
		When I go to the sign in page
	  And I sign in with "email@person.com" and "Password1"
	  When I follow "Edit"
	  Then I should see "Experience" within ".sidebar"
	  When I follow "Experience"	
	  And I follow "Add a new place"
	  And I fill in "Location" with "School B"
    And I fill in "Date from" with "19/03/2006"
    And I fill in "Date to" with "19/03/2008"  
	  And I press "Save"
	  Then I should see "Created"
		And I should see "School B" within "tr.header-row"
		When I follow "Edit" within "tr.header-row"
		And I fill in "Location" with "School B, Somewhere"
		When I press "Save" 
		Then I should see "Saved"
		When I follow "Delete" within "tr.header-row"
		Then I should see "Deleted"
		And I should not see "School B"
		
	Scenario: Creating a subject
		When I go to the sign in page
	  And I sign in with "email@person.com" and "Password1"
	  When I follow "Edit"
	  Then I should see "Experience" within ".sidebar"
	  When I follow "Experience"	
	  And I follow "Add a new place"
	  And I fill in "Location" with "School B"
	  And I fill in "Date from" with "19/03/2006"
	  And I fill in "Date to" with "19/03/2008"  
	  And I press "Save"
	  Then I should see "Created"
		When I follow "Add a course/subject"
		Then I should see "New Subject"
		When I fill in "Subject" with "English"
		And  I fill in "Level" with "GCSE"
		And I fill in "Grade" with "A*"
		And I press "Save"
		Then I should see "Created"
		And I should see "English" within "table.subjects"
		And I should see "GCSE" within "table.subjects"
		And I should see "A*" within "table.subjects"