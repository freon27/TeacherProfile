class AddColumnUserIdToSubjects < ActiveRecord::Migration
  def self.up
    add_column :subjects, :user_id, :integer
  end

  def self.down
    remove_column :subjects, :user_id
  end
end
