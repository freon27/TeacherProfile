Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.first_name             "First"
  user.last_name              "Last"
  user.email                  { Factory.next :email }
  user.password               "password"
  user.accepted_terms         "1"
end

Factory.define :user_with_profile, :parent => :user do |u|
  u.after_build do |u|
    u.profiles = [Factory(:profile, :user => u)]
  end
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.after_build { warn "[DEPRECATION] The :email_confirmed_user factory is deprecated, please use the :user factory instead." }
end
