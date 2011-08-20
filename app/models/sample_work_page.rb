class SampleWorkPage < ActiveRecord::Base
  belongs_to :profile
  has_many :subject_areas
end
