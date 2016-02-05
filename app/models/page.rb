class Page < ActiveRecord::Base

  # configuration
  extend FriendlyId
  friendly_id :title, use: :slugged

  # associations
  acts_as_nested_set

  # # callbacks
  # before_save :should_generate_new_friendly_id

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
