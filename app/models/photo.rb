class Photo < ActiveRecord::Base
  
   attr_accessible :photo, :caption
  
   has_attached_file :photo, :styles => { :medium => "600x600>", :thumb => "100x100#"}, :convert_options => { :all => "-auto-orient" }
   belongs_to :project
   belongs_to :user
   
   validates_presence_of :user
   validates_presence_of :project
   validates_presence_of :caption
   
   validates_attachment_presence :photo, :message => 'You must select an image to upload'                 
   validates_attachment_size :photo, :less_than=>2.megabytes, :message => 'Image must be 2MB or less'
   validates_attachment_content_type :photo, :content_type=>['image/jpeg', 'image/jpg', 'image/png', 'image/gif']
end
