module Roles
  extend ActiveSupport::Concern

  #------------------------------------------------------
  # Class Methods
  #------------------------------------------------------

  included do |base|

    # validations
    validates :role, presence: true, inclusion: { in: base::ROLES }

    # helpers
    base::ROLES.each do |r|
      define_method "#{ r }?" do
        self.role == r
      end

      scope "#{ r }_only", -> { where(role: r.to_s ) }
    end

  end

end