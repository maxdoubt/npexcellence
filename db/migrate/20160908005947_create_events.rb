class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string        :name,           null: false
      t.string        :slug,           unique: true
      t.string		    :state,       	 null: false
      t.string        :url
      t.text		      :description,		 null: false
      t.datetime      :begin_date,		 null: false
      t.datetime      :end_date,       null: false
      t.attachment    :photo
      t.integer		    :user_id,				 null: false
      t.integer		    :org_id
      t.timestamps                     null: false
    end
  end
end
