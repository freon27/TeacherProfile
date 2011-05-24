Feature: Profile

  In order to set up my profile
  As a profile owner
  I want to be able to edit my profile
  
  Background:
    Given the following user exists:
    | email            | password   |
    | email@person.com | Password1  |
    And the following profiles exist:
    | name       | user                     |
    | Profile A  | email: email@person.com  |
    When I go to the sign in page
    And I sign in as "email@person.com/Password1"
    
  Scenario: Edit profile
    When I follow "Edit" 
    Then I should see "Edit Profile"
		When I fill in "Profile Name" with "Profile B"
		And I fill in "Profile URL" with "profileb"
		And I press "Save"
		Then I should see "Saved." 
		And I should see "Profile B"
		When I follow "Edit"
		Then the "Profile URL" field should contain "profileb"

  Scenario: Edit profile links
    When I follow "Edit"
		Then I should see "Profile Details" within "li.sidebar-selected"
		When I follow "Introduction"
		Then I should see "Introduction" within "li.sidebar-selected"
		When I follow "Teaching Philosophy"
		Then I should see "Teaching Philosophy" within "li.sidebar-selected"
		When I follow "Experience"
		Then I should see "Experience" within "li.sidebar-selected"
