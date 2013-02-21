class AddAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean
  end
end
