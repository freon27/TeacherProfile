class AddColumnSubjectAreaIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :subject_area_id, :integer
  end

  def self.down
    remove_column :projects, :subject_area_id
  end
end
