class Training < ActiveRecord::Base

  # configuration
  extend FriendlyId
  friendly_id :name, use: :slugged

  # associations
  has_many 	 :registrations
  belongs_to :training_category

end
