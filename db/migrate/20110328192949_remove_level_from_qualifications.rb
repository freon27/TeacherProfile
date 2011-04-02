class RemoveLevelFromQualifications < ActiveRecord::Migration
  def self.up
    remove_column :qualifications, :level
  end

  def self.down
    add_column :qualifications, :level, :string
  end
end
