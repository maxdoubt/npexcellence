class AddAllDayToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :all_day, :boolean
  	add_column :events, :summary, :text
  end
end
