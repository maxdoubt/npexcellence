class Order < ActiveRecord::Base

  # mixins
  include AASM

  # assocations
  has_many      :registrations
  belongs_to    :user

  # callbacks
  before_create :set_order_status
  before_save   :update_subtotal

  # ----------------------------------------
  # AASM State Machine
  # ----------------------------------------

  aasm column: :state do 
    state :new, initial: true
    state :pending
    state :complete

    event :submitted do
      transitions from: :new,
                  to:   :pending
    end

    event :paid do
      transitions from: :pending,
                  to:   :complete
    end
  end

  # ----------------------------------------

  def subtotal
    registrations.collect { |r| r.attendees * r.fee }.sum
  end

  # ----------------------------------------
  # Private Methods
  # ----------------------------------------

  private

end