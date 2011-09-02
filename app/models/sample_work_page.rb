class SampleWorkPage < ActiveRecord::Base
  has_one :profile
  has_many :subject_areas
end
