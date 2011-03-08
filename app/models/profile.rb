class Profile < ActiveRecord::Base
  belongs_to :user
  validates_inclusion_of :published, :in => [true, false]
  validates :user, :presence => true
  validates :name, :presence => true
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

  private
    def create_pages
      self.build_main_page
      self.build_philosophy_page
    end
end
