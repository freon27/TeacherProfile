Then /^I should not see the control bar$/ do
  page.should_not have_selector(".topbar")
end