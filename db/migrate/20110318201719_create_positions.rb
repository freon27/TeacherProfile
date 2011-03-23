class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :location
      t.string :type
      t.date :date_from
      t.date :date_to
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
