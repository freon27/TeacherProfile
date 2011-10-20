class Feedback < ActiveRecord::Base
  
  attr_accessbile :name, :position, :feedback
  
  validates_presence_of :name
  validates_presence_of :position
  validates_presence_of :feedback
end
