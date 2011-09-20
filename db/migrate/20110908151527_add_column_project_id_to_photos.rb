class AddColumnProjectIdToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :project_id, :integer
  end

  def self.down
    remove_column :photos, :project_id
  end
end
