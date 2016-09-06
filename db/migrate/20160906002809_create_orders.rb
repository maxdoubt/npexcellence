class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer     :user_id,           null: false      
      t.integer     :payment_method,    null: false
      t.string      :state,				null: false
      t.text		:order_notes
      t.timestamps                      null: false
    end
  end
end
