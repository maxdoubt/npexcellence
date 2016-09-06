class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string        :name,                 null: false
      t.string        :location,             null: false
      t.string        :slug,                 unique: true
      t.text          :description,          null: false
      t.text          :facilitators,         null: false
      t.datetime      :begin_date,           null: false
      t.datetime      :end_date,             null: false
      t.integer       :max_registrations,    null: false
      t.boolean       :active,               null: false
      t.boolean       :featured,             null: false
      t.decimal       :fee,                  null: false
      t.integer       :training_category_id, null: false
      t.timestamps                           null: false
    end
  end
end
