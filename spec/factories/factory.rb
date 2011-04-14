
Factory.define :profile do |prof|
  prof.name         'Profile A'
  prof.published    false
  prof.association  :user
  prof.sequence(:url_suffix) {|n| "myprofile#{n}" }
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
  sa.name          'Design & Technology'
  sa.published     false
  sa.association   :profile
end

Factory.define :position do |pos|
  pos.location      'School A'
  pos.position_type 'ITT Placement'
  pos.date_from     Date.today.years_ago 1
  pos.date_to       Date.today.months_ago 6
  pos.description   'This was what I did there'
  pos.association   :experience_page
end

Factory.define :feedback do |fb|
  fb.name           'Joe Bloggs'
  fb.position       'Department Head'
  fb.feedback       'This is an example of what someone might write about someone else'
end

Factory.define :experience_page do |ep|
  ep.published      false
  ep.association    :profile
end

Factory.define :experience_page_with_position, :parent => :experience_page do |p|
  p.after_build do |p|
    p.positions = [Factory(:position, :experience_page => p)]
  end
end

Factory.define :qualification do |qual|
  qual.location       'Fake High School, Nowhere'
  qual.date_from      Date.today - 365
  qual.date_to        Date.today - 180
  qual.association    :experience_page
end

Factory.define :subject do |subj|
  subj.name           'Science'
  subj.level          'GCSE'
  subj.grade          'F'
  subj.association    :qualification
end

