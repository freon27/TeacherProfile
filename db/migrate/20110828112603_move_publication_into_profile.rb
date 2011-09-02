class MovePublicationIntoProfile < ActiveRecord::Migration
  def self.up
    add_column    :profiles, :main_page_id, :integer
    add_column    :profiles, :philosophy_page_id, :integer
    add_column    :profiles, :experience_page_id, :integer
    add_column    :profiles, :sample_work_page_id, :integer
    remove_column :main_pages, :profile_id
    remove_column :experience_pages, :profile_id
    remove_column :philosophy_pages, :profile_id
    remove_column :sample_work_pages, :profile_id
  end

  def self.down
    remove_column :profiles, :main_page_id
    remove_column :profiles, :philosophy_page_id
    remove_column :profiles, :experience_page_id
    remove_column :profiles, :sample_work_page_id
    add_column    :main_pages, :profile_id, :integer
    add_column    :experience_pages, :profile_id, :integer
    add_column    :philosophy_pages, :profile_id, :integer
    add_column    :sample_work_pages, :profile_id, :integer
  end
end
