class AddAllowedChannelsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :allowed_channels, :string, :default => '0,'
  end
end
