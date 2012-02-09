Feature: Profile

  In order to set up my profile
  As a profile owner
  I want to be able to edit my profile
  
  Background:
		
    Given a user exists with email: "email@person.com", password: "Password1"
 		And profile exists with name: "Profile A", user: the first user
    When I go to the sign in page
    And I sign in with "email@person.com" and "Password1"
    
  Scenario: Edit profile
    When I follow "Edit" 
    Then I should see "Edit Profile"
		When I fill in "Profile Name" with "Profile B"
		And I fill in "Profile URL" with "profileb"
		And I press "Save"
		Then I should see "Saved." 
		And I should see "Profile B"
		And the "Profile URL" field should contain "profileb"

  Scenario: Edit profile links
    When I follow "Edit"
		Then I should see "Profile Details" within "li.sidebar-selected"
		When I follow "Introduction"
		Then I should see "Introduction" within "li.sidebar-selected"
		When I follow "Teaching Philosophy"
		Then I should see "Teaching Philosophy" within "li.sidebar-selected"
		When I follow "Experience"
		Then I should see "Experience" within "li.sidebar-selected"
