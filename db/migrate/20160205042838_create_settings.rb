class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string      :phone,     null: false, default: '901.111.1111'
      t.string      :address,   null: false, default: '123 S. Main'
      t.string      :footer,    null: false, default: 'The footer'
      t.string      :title,     null: false, default: 'Website'
      t.attachment  :logo
    end
  end
end
