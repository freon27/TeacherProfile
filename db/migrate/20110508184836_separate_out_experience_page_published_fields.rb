class SeparateOutExperiencePagePublishedFields < ActiveRecord::Migration
  def self.up
    rename_column :experience_pages, :published, :publish_positions
    add_column :experience_pages, :publish_qualifications, :boolean
  end

  def self.down
    rename_column :experience_pages, :publish_positions, :published
    remove_column :experience_pages, :publish_qualifications
  end
end
