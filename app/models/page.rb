class Page < ActiveRecord::Base

  # configuration
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_ancestry

end
