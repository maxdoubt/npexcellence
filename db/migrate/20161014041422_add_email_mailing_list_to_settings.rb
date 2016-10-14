class AddEmailMailingListToSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :email,  		   :string
  	add_column :settings, :mailing_list,   :string
  end
end
