class AddColumnGradeToSubjects < ActiveRecord::Migration
  def self.up
    remove_column :subjects, :level
    add_column :subjects, :grade, :string
  end

  def self.down
    remove_column :subjects, :grade
    add_column :subjects, level, :string
  end
end
