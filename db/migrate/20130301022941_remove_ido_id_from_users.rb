class RemoveIdoIdFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :ido_id
  end

  def down
  	add_column :users, :ido_id, :text
  end
end
