class AddDefaultToProfilePublished < ActiveRecord::Migration
  def self.up
    change_column_default :profiles, :published, false
  end

  def self.down
    change_column_default :profiles, :published, nil 
  end
end
