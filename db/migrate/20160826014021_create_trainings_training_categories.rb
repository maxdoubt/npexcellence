class CreateTrainingsTrainingCategories < ActiveRecord::Migration
  def change
    create_table :trainings_training_categories do |t|
      t.belongs_to :training_category, 	index: true, foreign_key: true
      t.belongs_to :training, 			index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end