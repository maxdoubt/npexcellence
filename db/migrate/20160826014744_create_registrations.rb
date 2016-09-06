class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer     :training_id,       null: false
      t.integer     :attendees,         null: false
      t.integer     :order_id,          null: false
      t.timestamps                      null: false
    end
  end
end
