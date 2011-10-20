class SubjectArea < ActiveRecord::Base
  
  attr_accessible :name
  
  belongs_to :user
  belongs_to :sample_work_page
  has_many :projects

  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :sample_work_page_id

end
