class CreateSubjectAreas < ActiveRecord::Migration
  def self.up
    create_table :subject_areas do |t|
      t.integer :profile_id
      t.string :name
      t.boolean :published

      t.timestamps
    end
  end

  def self.down
    drop_table :subject_areas
  end
end
