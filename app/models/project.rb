class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  has_many :documents
  belongs_to :profile
end
