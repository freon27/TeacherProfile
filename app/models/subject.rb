class Subject < ActiveRecord::Base
  belongs_to :qualification
  validates_presence_of :qualification
  validates_presence_of :name
  validates_presence_of :level

end
