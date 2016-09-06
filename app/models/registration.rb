class Registration < ActiveRecord::Base

  # associations
  belongs_to :training
  belongs_to :order

end
