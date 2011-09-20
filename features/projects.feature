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
		Then I should see "Edit Project"
		And the "Name" field should equal "Project A"
		
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
		
	Scenario: Managing photos
		Given a sample_work_page exists
		And a subject area exists with sample_work_page: the first sample_work_page
		And a project exists with subject_area: the first subject_area, name: "Project A"
		And I am signed in as the owner of the subject area
		And I am on the sample_work_page edit page
		And I follow "Edit"
		Then I should see "Project A"
		When I follow "Edit"
		Then I should see "Edit Project"
		And I should see "No images uploaded"
		When I follow "Upload Image"
		And I fill in "Caption" with "This is a photo"
		And I attach the file "spec/files/test.png" to "File"
		And I press "Upload"
		Then I should see "Uploaded"
		When I follow image link "This is a photo"
		Then I should see "Edit Image Details"
		When I fill in "Caption" with "Test"
		And I press "Update"
		Then I should see "Updated"
		When I follow image link "Test"
		And I press "Delete"
		Then I should see "Deleted"
		And I should see "No images uploaded"

		Scenario: Managing documents
			Given a sample_work_page exists
			And a subject area exists with sample_work_page: the first sample_work_page
			And a project exists with subject_area: the first subject_area, name: "Project A"
			And I am signed in as the owner of the subject area
			And I am on the sample_work_page edit page
			And I follow "Edit"
			Then I should see "Project A"
			When I follow "Edit"
			Then I should see "Edit Project"
			And I should see "No documents uploaded"
			When I follow "Upload Document"
			And I fill in "Caption" with "This is a document"
			And I attach the file "spec/files/test.doc" to "File"
			And I press "Upload"
			Then I should see "Uploaded"


			