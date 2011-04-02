class ChangeSubjectColumnToName < ActiveRecord::Migration
  def self.up
    rename_column :subjects, :subject, :name
  end

  def self.down
    rename_column :subjects, :name, :subject
  end
end
