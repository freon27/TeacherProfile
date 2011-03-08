class AddPublishedToMainPage < ActiveRecord::Migration
  def self.up
    add_column :main_pages, :published, :boolean
  end

  def self.down
    remove_column :main_pages, :published
  end
end
