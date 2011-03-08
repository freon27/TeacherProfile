class PhilosophyPage < ActiveRecord::Base
  validates_presence_of :philosophy
  validates_presence_of :profile
  validates_inclusion_of :published, :in => [true, false]
  belongs_to :profile
end
