class User < ActiveRecord::Base
  
  #-------------------------------------------------------------------------------
  # Configuration
  #-------------------------------------------------------------------------------

  # constants
  ROLES  = ['admin', 'user']

  # callbacks
  before_validation :ensure_role
  
  # mixins
  acts_as_authentic do |c|
    c.crypto_provider             = Authlogic::CryptoProviders::BCrypt
    c.perishable_token_valid_for  = 7.days
  end
  has_paper_trail :ignore => [
    :password_salt,
    :persistence_token,
    :single_access_token,
    :login_count,
    :failed_login_count,
    :current_login_at,
    :last_login_at,
    :current_login_ip,
    :last_login_ip
  ]
  include Roles

  # associations
  has_many :posts
  
  # alliases
  alias_attribute :access_code,       :perishable_token
  alias_attribute :confirmation_code, :perishable_token 
    
  # validations
  validates_presence_of     :first_name
  validates_length_of       :first_name,      :maximum => 100,  :allow_nil => true
  validates_presence_of     :last_name
  validates_length_of       :last_name,       :maximum => 100,  :allow_nil => true
  
  # scopes
  scope :active_only,       lambda { where("deactivated_at is null")  }
  scope :inactive_only,     lambda { where("deactivated_at is not null") }
  scope :confirmed_only,    lambda { where("confirmed_at is not null")  }
  scope :unconfirmed_only,  lambda { where("confirmed_at is null") }
  
  
  
  #-------------------------------------------------------------------------------
  # Public Class Methods
  #-------------------------------------------------------------------------------
  
  # This method operates like a named scope. It uses the model's reference to arel table
  # to simplify the logic of "or"ing together a few relation commands.
  #
  # The method is unforgiving. Null or empty keywords return no results.
  #
  def self.for_keywords(keywords)
    if keywords.blank? or keywords.empty?
      where("1 = 2")
    else
      t = arel_table
      predicates = keywords.uniq.map do |word|
        t[:first_name].matches("%#{word}%").or(t[:last_name].matches("%#{word}%"))
      end
      where predicates.reduce(predicates.shift) { |p, p_sub| p.or(p_sub) }
    end
  end
  
  
  
  #-------------------------------------------------------------------------------
  # Public Instance Methods
  #-------------------------------------------------------------------------------
  
  # =================== Active/Inactive =============================
  
  # # This method flags the user as active.
  # #
  # def activate
  #   self.deactivated_at = nil
  # end
  
  # # This method reports whether or not the user is active.
  # #
  # def active?
  #   self.deactivated_at.nil?
  # end
  
  # # This method flags the user as inactive.
  # #
  # def deactivate
  #   self.deactivated_at = Time.now
  # end
  
  # # This method reports whether or not the user is inactive.
  # #
  # def inactive?
  #   !self.active?
  # end
  
  
  # =================== Confirmation ================================
  
  # # This method flags the user as having been confirmed.
  # #
  # def confirm
  #   self.confirmed_at = Time.now
  # end
  
  # # This method flags the user as having been confirmed and saves.
  # #
  # def confirm!
  #   self.confirmed_at = Time.now
  #   self.save
  # end
  
  # # This method reports whether or not the user has confirmed her account.
  # #
  # def confirmed?
  #   self.new_record? || self.confirmed_at? || (self.created_at > 7.days.ago)
  # end
  
  # # This method inverts the confirmed? status.
  # #
  # def unconfirmed?
  #   !self.confirmed?
  # end
    
  
  # =================== Other ================================
  
  # This method uses Name to parses the parameter and sets the first and last names 
  # from the calculated values of the Name instance.
  #
  def name=(full_name)
    name            = Name.parse(full_name)
    self.first_name = name.first_name
    self.last_name  = name.last_name
  end
      
  # This method uses the first and last name values to return an instance of 
  # Name.
  #
  def name
    Name.new(self.first_name, self.last_name)
  end


  #-------------------------------------------------------------------------------
  # Private Methods
  #-------------------------------------------------------------------------------
  private

  def ensure_role
    unless ROLES.include?(self.role)
      self.role = 'user'
    end
  end


end