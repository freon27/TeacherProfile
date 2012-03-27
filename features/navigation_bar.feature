Feature: Navigation Bar

  In order to navigate around the site
  As a visitor
  I want to be shown the correct links

  Scenario: A non-signed in visitor to the main site
    Given I am on the root page
    Then I should see "Sign in" within ".topbar"
		And I should see "Register" within ".topbar"
		
	Scenario: As a signed in user on the main site
		Given I sign in
	  Then I should see "Dashboard" within ".topbar"
		And I should see "Account" within ".topbar"
		And I should see a "Sign out" button
		And I should see "Support" within ".topbar"
		
	Scenario: As a signed in user editing a profile
	  Given a profile exists
		And I am signed in as the owner of the profile
		And I am on the profile edit page
	  Then I should see "View profile" within ".topbar"
	  And I should see "Dashboard" within ".topbar"
		And I should see "Account" within ".topbar"
		And I should see "Support" within ".topbar"
		And I should see a "Sign out" button
		
	Scenario: A non-signed in user viewing a profile
		Given a profile exists
		And I am on the profile page
		Then I should not see the control bar

	Scenario: A signed in user viewing their own profile
	  Given a profile exists
		And I am signed in as the owner of the profile
		And I am on the profile page
		Then I should see "Edit this profile" within ".topbar"

	Scenario: A signed in user viewing their someone else's profile
		Given I sign in
		And a profile exists with published: true
		And I am on the profile page
		Then I should see "Dashboard" within ".topbar"
		And I should see "Account" within ".topbar"
		And I should see "Support" within ".topbar"
		And I should not see "Edit this profile" within ".topbar"