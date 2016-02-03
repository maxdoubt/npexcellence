class Post < ActiveRecord::Base

  # configuration
  extend FriendlyId
  friendly_id :title, use: :slugged

  # associations
  belongs_to :user

end
