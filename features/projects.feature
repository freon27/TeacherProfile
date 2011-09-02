Feature: Projects

  As a profile owner
  In order to show my sample work 
  I want to be able to display display the projects I've done for a subject area
  
	Scenario: Creating a new project
  	Given a user exists with email: "email@person.com", password: "Password1"	
	 	And profile exists with name: "Profile A", user: the first user
  	And I sign in as "email@person.com/Password1"
	 	And I am on the profile edit page
    When I follow "Sample Work"
		Then I should see "Sample Work"
		And I should see "You currently don't have any subject areas listed"
		When I follow "Add a subject area"
		Then I should see "New Subject Area"
		When I fill in "Name" with "Systems and Control"
		And I press "Create"
		And I follow "Edit"
		Then I should see "This subject area currently has no projects. Why not create one now?"
		When I follow "Add Project"
		And I fill in "Name" with "Project A"
		And I fill in "Description" with "This is my example project"
		And I press "Create"
		Then I should see "Project A" within "table#projects-list"
		And I should not see "This subject area currently has no projects. Why not create one now?"
		
	Scenario: Editing a project
		Given a sample_work_page exists
		And a subject area exists with sample_work_page: the first sample_work_page
		And a project exists with subject_area: the first subject_area, name: "Project A"
		And I am signed in as the owner of the subject area
		And I am on the sample_work_page edit page
		And I follow "Edit"
		Then I should see "Project A"
		When I follow "Edit"
		Then I should see "Edit Project"
		When I fill in "Name" with ""
		And I press "Update"
		Then I should see "can't be blank"
		When I fill in "Name" with "New Project Name"
		And I fill in "Description" with "A Description"
		And I press "Update"
		Then I should see "Saved"

		Scenario: Deleting a project
			Given a sample_work_page exists
			And a subject area exists with sample_work_page: the first sample_work_page
			And a project exists with subject_area: the first subject_area, name: "Project A"
			And I am signed in as the owner of the subject area
			And I am on the sample_work_page edit page
			And I follow "Edit"
			Then I should see "Project A"
			When I follow "Delete"
			Then I should see "Deleted"
			And I should see "Edit Subject Area"
			And I should not see "Project A"
			