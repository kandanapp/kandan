class AddStatusAsDefaultForUsers < ActiveRecord::Migration
  def up
  	rename_column :users, :status, :registration_status
  	change_column :users, :registration_status, :string, :default => "active"
  end

  def down
  	change_column :users, :registration_status, :string, :default => nil
  	rename_column :users, :registration_status, :status
  end
end
