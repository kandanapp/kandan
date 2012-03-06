class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :content
      t.integer :channel_id
      t.integer :user_id
      t.string :action

      t.timestamps
    end
  end
end
