class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer     :user_id,           null: false
      t.integer     :training_id,       null: false
      t.integer     :attendees,         null: false
      t.boolean     :paid,              null: false
      t.boolean     :current_payment,   null: false
      t.string      :payment_method,    null: false
      t.timestamps                      null: false
    end
  end
end
