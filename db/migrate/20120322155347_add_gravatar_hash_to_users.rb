class AddGravatarHashToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gravatar_hash, :text

  end
end
