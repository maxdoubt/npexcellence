class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.attachment :upload
      t.integer    :user_id
    end
    add_index :uploads, [:user_id], name: :idx_uploads_on_uid
  end
end
