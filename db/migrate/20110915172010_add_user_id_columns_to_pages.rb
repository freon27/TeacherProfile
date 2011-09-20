class AddUserIdColumnsToPages < ActiveRecord::Migration
  def self.up
    add_column :main_pages, :user_id, :integer
    add_column :experience_pages, :user_id, :integer
    add_column :philosophy_pages, :user_id, :integer
    add_column :sample_work_pages, :user_id, :integer
 
  end

  def self.down
    remove_column :main_page, :user_id
    remove_column :experience_pages, :user_id
    remove_column :philosophy_pages, :user_id
    remove_column :sample_work_pages, :user_id
  end
end
