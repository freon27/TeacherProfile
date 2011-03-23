class AddProfileIdToExperiencePages < ActiveRecord::Migration
  def self.up
    add_column :experience_pages, :profile_id, :integer
  end

  def self.down
    remove_column :experience_pages, :profile_id
  end
end
