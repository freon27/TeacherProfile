class AddColumnSubscribedUntilToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :subscribed_until, :datetime, { :null => false, :default => Time.now }
  end

  def self.down
    remove_column :users, :subscribed_until
  end
end