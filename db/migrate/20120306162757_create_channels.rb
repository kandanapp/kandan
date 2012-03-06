class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.text :name

      t.timestamps
    end
  end
end
