class Project < ActiveRecord::Base
  
  attr_accessible :name, :description

  has_many :documents, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  belongs_to :subject_area
  belongs_to :user
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user
end
