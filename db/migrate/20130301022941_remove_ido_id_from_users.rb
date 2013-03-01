class RemoveIdoIdFromUsers < ActiveRecord::Migration
  def up
  	remove_index :users, :ido_id
  	remove_column :users, :ido_id
  end

  def down
  	add_column :users, :ido_id, :text
  	add_index :users, :ido_id, :unique => true
  end
end
