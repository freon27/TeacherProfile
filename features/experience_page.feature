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
		

  Scenario: Creating a position with valid data
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    Then I should see an "Edit" button
    When I press "Edit"
    Then I should see "Experience" within "#profile-sidebar"
    When I follow "Experience"
    Then I should see "No positions listed"
    When I press "Add Position"
    And I fill in "Location" with "School A"
    And I fill in "Position type" with "School A"
    And I select "March 19th, 2006" as the position "date_from" date
		And I select "March 19th, 2008" as the position "date_to" date    
		And I fill in "Description" with "My first sample placement"
    And I press "Create Position"
    Then I should see "Created"
		And I should see "School A" within "table[id=position-list]"

  Scenario: Creating a position with invalid data
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    Then I should see an "Edit" button
    When I press "Edit"
    Then I should see "Experience" within "#profile-sidebar"
    When I follow "Experience"
    Then I should see "No positions listed"
    When I press "Add Position"
    And I fill in "Location" with "School A"
    And I press "Create Position"
    Then I should see error messages
	
	
	
  Scenario: Editing a position
		When I go to the sign in page
	  And I sign in as "email@person.com/Password1"
	  Then I should see an "Edit" button
	  When I press "Edit"
	  Then I should see "Experience" within "#profile-sidebar"
	  When I follow "Experience"
	  When I press "Add Position"
	  And I fill in "Location" with "School A"
	  And I fill in "Position type" with "School A"
	  And I select "March 19th, 2006" as the position "date_from" date
		And I select "March 19th, 2008" as the position "date_to" date    
		And I fill in "Description" with "My first sample placement"
	  And I press "Create Position"
	  Then I should see "Created"
		And I should see "School A" within "table[id=position-list]"
		And I should see an "Edit" button
		When I press "Edit"
		And I fill in "Position type" with "Full time"
		When I press "Update Position" 
		Then I should see "Saved"
		And I should see a "Delete" button
		When I press "Delete" within "table[id=position-list]"
		Then I should see "Deleted"
		And I should not see "School A"
		
		
  Scenario: Editing a qualification
		When I go to the sign in page
	  And I sign in as "email@person.com/Password1"
	  Then I should see an "Edit" button
	  When I press "Edit"
	  Then I should see "Experience" within "#profile-sidebar"
	  When I follow "Experience"
	  When I follow "Add a new place"
	  And I fill in "Location" with "School B"
	  And I select "March 19th, 2006" as the qualification "date_from" date
		And I select "March 19th, 2008" as the qualification "date_to" date    
	  And I press "Add a course/subject"
	  Then I should see "Created"
		And I should see "School B" within "table[id=qualification-list]"
		And I should see an "Edit" button
		When I press "Edit" within "table[id=qualification-list]"
		And I fill in "Location" with "School B, Somewhere"
		When I press "Update Qualification" 
		Then I should see "Saved"
		And I should see a "Delete" button
		When I press "Delete" within "table[id=qualification-list]"
		Then I should see "Deleted"
		And I should not see "School B, somewhere"