class AddProfileIdToPhilosophyPages < ActiveRecord::Migration
  def self.up
    add_column :philosophy_pages, :profile_id, :integer
  end

  def self.down
    remove_column :philosophy_pages, :profile_id
  end
end
