class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :position_id
      t.string :name
      t.string :position
      t.text :feedback

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
