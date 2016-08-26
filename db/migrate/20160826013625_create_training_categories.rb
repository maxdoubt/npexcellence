class CreateTrainingCategories < ActiveRecord::Migration
  def change
    create_table :training_categories do |t|
      t.string :name, null: false
    end
  end
end
