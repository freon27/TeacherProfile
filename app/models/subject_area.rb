class SubjectArea < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :sample_work_page_id
  belongs_to :sample_work_page
end
