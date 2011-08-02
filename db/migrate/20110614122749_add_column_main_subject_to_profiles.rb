class AddColumnMainSubjectToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :main_subject, :string
  end

  def self.down
    remove_column :profiles, :main_subject
  end
end
