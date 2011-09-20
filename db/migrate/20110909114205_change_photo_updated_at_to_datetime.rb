class ChangePhotoUpdatedAtToDatetime < ActiveRecord::Migration
  def self.up
    change_column :photos, :photo_updated_at, :datetime
  end

  def self.down
    change_column :photos, :photo_updated_at, :date
  end
end
