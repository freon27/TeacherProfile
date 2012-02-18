

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
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{ user.email }"}
  step %{I fill in "Password" with "password"}
  step %{I press "Sign in"}
end

Then(/^tell me about the #{capture_model}$/) do |object|
  puts "#{  object }: #{model!(object).inspect }"
end

Then(/^tell me about the #{capture_model}'s profile$/) do |object|
  puts model!(object).profile.inspect
end

Then(/^tell me the time$/) do 
  puts Time.now
end
