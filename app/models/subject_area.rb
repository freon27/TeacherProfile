class SubjectArea < ActiveRecord::Base
  
  validates :name, :presence => true
  validates :profile, :presence => true
  validates_inclusion_of :published, :in => [true, false]
  
  belongs_to  :profile
  
end
