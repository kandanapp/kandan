class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.text :values, :limit => nil

      t.timestamps
    end
  end
end
