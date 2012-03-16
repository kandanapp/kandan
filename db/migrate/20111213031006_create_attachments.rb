class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :user
      t.references :channel
      t.references :message

      t.string     :file_file_name
      t.string     :file_content_type
      t.integer    :file_file_size
      t.datetime   :file_updated_at

      t.timestamps
    end
  end
end
