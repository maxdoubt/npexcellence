class AddPaypalToTrainings < ActiveRecord::Migration
  def up
    add_attachment :trainings, :photo
    add_column 	   :trainings, :all_day,            :boolean,                 default: false
    add_column     :trainings, :multi_day,          :boolean,                 default: false
    add_column     :trainings, :days,               :jsonb,   null: false,    default: '{}'
    add_column 	   :trainings, :paypal_url,         :string
    add_column     :trainings, :paypal_url_member,  :string
  	add_column     :trainings, :summary, 	          :text
  	add_column	   :trainings, :state,              :string
    add_column     :trainings, :fee_member,         :decimal
    add_column     :trainings, :fit,                :text
  	remove_column  :trainings, :active
  end

  def down
    remove_attachment :trainings, :photo
    remove_column	    :trainings, :all_day
    remove_column     :trainings, :multi_day
    remove_column     :trainings, :days
    remove_column	    :trainings, :paypal_url
    remove_column     :trainings, :paypal_url_member
  	remove_column     :trainings, :summary
  	remove_column     :trainings, :state
    remove_column     :trainings, :fee_member
    remove_column     :trainings, :fit
  	add_column		    :trainings, :active,     :boolean
  end
end
