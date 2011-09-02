class Document < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_attached_file :document
  validates_presence_of :user
end
