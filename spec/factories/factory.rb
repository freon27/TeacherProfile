
Factory.define :profile do |prof|
  prof.name         'Profile A'
  prof.published    false
  prof.association  :user
end

Factory.define :main_page do |mp|
  mp.introduction   'Welcome to my profile page.'
  mp.published      false
  mp.association    :profile
end

Factory.define :philosophy_page do |phil|
  phil.philosophy   'This is my philosophy'
  phil.published    false
  phil.association  :profile
end


Factory.define :subject_area do |sa|
  sa.name           'Design & Technology'
  sa.published      false
  sa.association    :profile
end
