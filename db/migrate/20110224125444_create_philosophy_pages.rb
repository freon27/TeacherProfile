class CreatePhilosophyPages < ActiveRecord::Migration
  def self.up
    create_table :philosophy_pages do |t|
      t.boolean :published
      t.text :philosophy

      t.timestamps
    end
  end

  def self.down
    drop_table :philosophy_pages
  end
end
