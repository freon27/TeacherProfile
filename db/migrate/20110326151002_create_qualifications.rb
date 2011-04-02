class CreateQualifications < ActiveRecord::Migration
  def self.up
    create_table :qualifications do |t|
      t.string :level
      t.string :location
      t.date :date_from
      t.date :date_to
      t.integer :experience_page_id

      t.timestamps
    end
  end

  def self.down
    drop_table :qualifications
  end
end
