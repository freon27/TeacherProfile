

#
#Then /^I should see the profile page links$/ do
#  with_scope('#profile-sidebar') do
#    if page.respond_to? :should
#      page.should have_content(')
#    else
#      assert page.has_content?(text)
#    end
#  end
#end

Given(/^I am signed in as the owner of #{capture_model}$/) do |object|
  user = model!(object).user
  When %{I go to the sign in page}
  And %{I fill in "Email" with "#{ user.email }"}
  And %{I fill in "Password" with "Password1"}
  And %{I press "Sign in"}
end

Then(/^tell me about the #{capture_model}$/) do |object|
  puts "#{  object }: #{model!(object).inspect }"
end

Then(/^tell me about the #{capture_model}'s profile$/) do |object|
  puts model!(object).profile.inspect
end

