class AddPaypalToTrainings < ActiveRecord::Migration
  def up
    add_attachment :trainings, :photo
    add_column 	   :trainings, :all_day,    :boolean, default: false
    add_column 	   :trainings, :paypal_url, :string
  	add_column     :trainings, :summary, 	:text
  	add_column	   :trainings, :state,      :string
  	remove_column  :trainings, :active
  end

  def down
    remove_attachment :trainings, :photo
    remove_column	  :trainings, :all_day
    remove_column	  :trainings, :paypal_url
  	remove_column     :trainings, :summary
  	remove_column     :trainings, :state
  	add_column		  :trainings, :active,     :boolean
  end
end
