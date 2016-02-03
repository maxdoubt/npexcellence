class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      # our fields
      t.string      :title,     null: false
      t.string      :body
      t.string      :slug,      unique: true
      t.integer     :user_id,   null: false
      t.boolean     :published, null: false, default: false

      t.timestamps              null: false
    end
  end
end
