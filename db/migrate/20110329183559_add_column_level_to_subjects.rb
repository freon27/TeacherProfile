class AddColumnLevelToSubjects < ActiveRecord::Migration
  def self.up
    remove_column :subjects, :completion
    add_column :subjects, :level, :string
  end

  def self.down
    remove_column :subjects, :level
    add_column :subjects, :completion, :date
  end
end
