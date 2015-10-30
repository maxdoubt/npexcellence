class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      # our fields
      t.string      :title,     null: false
      t.string      :body
      t.string      :ancestry
      t.string      :slug,      unique: true

      t.timestamps              null: false
    end
    add_index :pages, [:ancestry],  name: :idx_pages_on_ancestry
  end
end
