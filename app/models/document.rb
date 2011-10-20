class Document < ActiveRecord::Base
  
  attr_accessible :document, :caption, :description
  
  has_attached_file :document
  belongs_to :project
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :project
  validates_presence_of :caption

  validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 2.megabytes
  validates_attachment_content_type :document, :content_type => ['application/excel', 'application/msword', 'application/pdf', 'text/plain', 'application/rtf']
end