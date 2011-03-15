class Profile < ActiveRecord::Base
  
  LIMIT = 3
  
  belongs_to :user
  validates_inclusion_of :published, :in => [true, false]
  validates :user, :presence => true
  validates :name, :presence => true
  validate  :validate_quota

  has_one :main_page
  has_one :philosophy_page
  has_many :subject_areas
  after_create :create_pages
  
  def publish
    self.published = true
  end
  
  def unpublish
    self.published = false
  end

  def validate_quota
    return unless self.user
    if self.user.profiles(:reload).count >= LIMIT
      errors.add(:base, "You cannot have more than #{ LIMIT } profiles")
    end
  end
    
  private
    def create_pages
      self.build_main_page
      self.build_philosophy_page
    end

end
