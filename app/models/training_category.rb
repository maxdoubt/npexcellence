class TrainingCategory < ActiveRecord::Base

  # associations
  has_many 	 :registrations
  has_many   :trainings

end
