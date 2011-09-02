class RemoveColumnPublishedFromSubjectAreas < ActiveRecord::Migration
  def self.up
    remove_column :subject_areas, :published
  end

  def self.down
    add_column :subject_areas, :published, :boolean
  end
end
