class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string      :name,              null: false
      t.string      :slug,              unique: true
      t.string      :role,              null: false
      t.boolean     :active,            null: false

      t.string      :phone
      t.string      :address
      t.string      :contact
      t.string      :email
      t.string      :website

      t.text        :description
      t.text        :funding

      t.attachment  :logo
      t.attachment  :photo

      t.timestamps                      null: false
    end
  end
end
