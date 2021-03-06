class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string      :name,              null: false
      t.string      :abbreviation 
      t.string      :slug,              unique: true
      t.string      :role,              null: false
      t.boolean     :active,            null: false

      t.string      :phone
      t.string      :address
      t.string      :city
      t.string      :contact
      t.string      :email
      t.string      :website
      t.string      :org_type

      t.text        :description
      t.text        :inspiration
      t.text        :pride
      t.text        :involvement
      t.text        :funding
      t.text        :alliance
      t.text        :interviewee
      t.string      :interviewee_title        

      t.attachment  :logo
      t.attachment  :staff_photo
      t.attachment  :photo
      t.attachment  :photo_two
      t.attachment  :photo_three
      t.attachment  :photo_four

      t.boolean     :spotlight

      t.timestamps                      null: false
    end
  end
end
