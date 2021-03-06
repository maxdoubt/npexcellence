class Training < ActiveRecord::Base

  # mixins
  include AASM

  # configuration
  extend FriendlyId
  friendly_id :name, use: :slugged

  # associations
  has_many 	 :registrations
  belongs_to :training_category

  # ----------------------------------------
  # AASM State Machine
  # ----------------------------------------

  aasm column: :state do 
    state :new, initial: true
    state :pending
    state :published
    state :featured

    event :submitted do
      transitions from: :new,
                  to:   :pending
    end

    event :publish do
      transitions from: :pending,
                  to:   :published
    end

    event :feature do
      transitions from: :published,
                  to:   :featured
    end
  end

  has_attached_file :photo, styles: {
    square: '300x300#',
    medium: '300x300>',
    large:  '1920x1080#'
  }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


end
