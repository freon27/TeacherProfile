
Factory.define :profile do |prof|
  prof.name         'Profile A'
  prof.published    false
  prof.association  :user
  prof.main_subject 'Design & Technology'
  prof.sequence(:url_suffix) {|n| "myprofile#{n}" }
end

Factory.define :main_page do |mp|
  mp.introduction   'Welcome to my profile page.'
  mp.published      true
  mp.association    :user
  mp.after_create do |s|
      profile = Factory(:profile, :main_page_id => s.id, :user => s.user)
  end
end

Factory.define :philosophy_page do |phil|
  phil.philosophy   'This is my philosophy'
  phil.published    true
  phil.after_create do |s|
      profile = Factory(:profile, :philosophy_page_id => s.id)
  end
end

Factory.define :experience_page do |ep|
  ep.publish_positions      true
  ep.publish_qualifications false
  ep.association           :user
  ep.after_create do |s|
      Factory(:profile, :experience_page_id => s.id, :user => s.user)
  end
end

Factory.define :experience_page_with_position, :parent => :experience_page do |p|
  p.after_create do |p|
    p.positions = [Factory(:position, :experience_page => p)]
  end
end

Factory.define :sample_work_page do |swp|
  swp.published     true
  swp.association   :user
  swp.after_create do |s|
      profile = Factory(:profile, :sample_work_page_id => s.id, :user => s.user)
  end
end

Factory.define :subject_area do |sa|
  sa.name          'Design & Technology'
  sa.association   :sample_work_page
  sa.after_build do |s|
    s.user = s.sample_work_page.profile.user
  end
end

Factory.define :position do |pos|
  pos.association   :experience_page
  pos.location      'School A'
  pos.position_type 'ITT Placement'
  pos.date_from     Date.today.years_ago 1
  pos.date_to       Date.today.months_ago 6
  pos.description   'This was what I did there'
  pos.after_build do |p|
    p.user = p.experience_page.profile.user 
  end
end

Factory.define :feedback do |fb|
  fb.name           'Joe Bloggs'
  fb.position       'Department Head'
  fb.feedback       'This is an example of what someone might write about someone else'
end


Factory.define :qualification do |qual|
  qual.location       'Fake High School, Nowhere'
  qual.date_from      Date.today - 365
  qual.date_to        Date.today - 180
  qual.association    :experience_page
  qual.after_build do |q|
    q.user = q.experience_page.profile.user
  end
end

Factory.define :subject do |subj|
  subj.name           'Science'
  subj.level          'GCSE'
  subj.grade          'F'
  subj.association    :qualification
  subj.after_build do |s|
    s.user = s.qualification.user
  end
end

Factory.define :completed_profile, :parent => :profile do |prof|
  prof.after_build do |p|
    puts p.inspect
    prof.main_page       Factory(:main_page, :profile => p)
    prof.experience_page Factory(:experience_page_with_position, :profile => p)
    prof.philosophy_page Factory(:philosophy_page, :profile => p)
  end
end

Factory.define :project do |proj|
  proj.name           'Blood and Teeth'
  proj.description    'This was my first project and was about blood and teeth'
  proj.association    :subject_area
  proj.after_build do |p|
    p.user = p.subject_area.user
  end
end


Factory.define :document do |doc|
  include ActionDispatch::TestProcess
  doc.caption         'This is what my file is'
  doc.description     'Here iss where I can give you little more information about my file'
  doc.document        fixture_file_upload(Rails.root + 'spec/files/test.doc', 'application/msword')
  doc.association     :project
  doc.after_build do |d|
    d.user = d.project.user
  end
end

Factory.define :photo do |photo|
  include ActionDispatch::TestProcess
  photo.caption         'This is what my file is'
  photo.photo           fixture_file_upload(Rails.root + 'spec/files/test.png', 'image/png')
  photo.association     :project
  photo.after_build do |p|
    p.user = p.project.user
  end
end