class CreateSampleWorkPages < ActiveRecord::Migration
  def self.up
    create_table :sample_work_pages do |t|
      t.boolean :published
      t.integer :profile_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sample_work_pages
  end
end
