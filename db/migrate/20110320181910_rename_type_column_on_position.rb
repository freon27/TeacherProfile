class RenameTypeColumnOnPosition < ActiveRecord::Migration
  def self.up
    rename_column :positions, :type, :position_type
  end

  def self.down
    rename_column :positions, :position_type, :type
  end
end
