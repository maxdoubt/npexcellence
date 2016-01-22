class Page < ActiveRecord::Base

  # configuration
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_nested_set
end
