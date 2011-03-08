class CreateMainPages < ActiveRecord::Migration
  def self.up
    create_table :main_pages do |t|
      t.integer :profile_id
      t.text :introduction

      t.timestamps
    end
  end

  def self.down
    drop_table :main_pages
  end
end
