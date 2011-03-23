class AddExperiencePageIdToPositions < ActiveRecord::Migration
  def self.up
    add_column :positions, :experience_page_id, :integer
  end

  def self.down
    remove_column :positions, :experience_page_id
  end
end
