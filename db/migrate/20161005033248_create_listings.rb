class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer       :org_id
      t.integer       :user_id
      t.string        :org_name
      t.string        :title
      t.string        :state,          null: false
      t.string        :email
      t.string        :phone
      t.string        :url
      t.text          :description
      t.text          :responsibilities
      t.text          :qualifications
      t.text          :instructions
      t.datetime      :date_posted,    null: false
      t.boolean       :full_time,      default: true
      t.attachment    :upload
      t.timestamps                     null: false
    end
  end
end
