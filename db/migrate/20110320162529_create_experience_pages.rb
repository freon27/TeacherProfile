class CreateExperiencePages < ActiveRecord::Migration
  def self.up
    create_table :experience_pages do |t|
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :experience_pages
  end
end
