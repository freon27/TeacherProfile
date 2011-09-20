class Project < ActiveRecord::Base

  has_many :documents
  has_many :photos
  belongs_to :subject_area
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user
end