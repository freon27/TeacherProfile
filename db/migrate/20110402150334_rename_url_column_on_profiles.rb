class RenameUrlColumnOnProfiles < ActiveRecord::Migration
  def self.up
    rename_column :profiles, :url, :url_suffix
  end

  def self.down
    rename_column :profiles, :url_suffix, :url
  end
end
