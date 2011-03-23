class Feedback < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :position
  validates_presence_of :feedback
end
