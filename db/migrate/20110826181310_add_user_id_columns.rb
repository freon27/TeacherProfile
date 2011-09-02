class AddUserIdColumns < ActiveRecord::Migration
  def self.up
    add_column :projects, :user_id, :integer
    add_column :qualifications, :user_id, :integer
    add_column :subject_areas, :user_id, :integer
    add_column :positions, :user_id, :integer
    add_column :documents, :user_id, :integer
    add_column :photos, :user_id, :integer
  end

  def self.down
    remove_column :projects, :user_id
    remove_column :qualifications, :user_id
    remove_column :subject_areas, :user_id
    remove_column :positions, :user_id
    remove_column :documents, :user_id
    remove_column :photos, :user_id
  end
end
