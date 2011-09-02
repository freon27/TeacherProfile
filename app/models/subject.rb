class Subject < ActiveRecord::Base
  belongs_to :qualification
  belongs_to :user
  
  validates_presence_of :qualification
  validates_presence_of :name
  validates_presence_of :level
  validates_presence_of :user

end
