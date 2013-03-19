class AddUserToChannels < ActiveRecord::Migration
  def change
    add_column :channels, :user_id, :integer
    add_index :channels, :user_id
  end
end
