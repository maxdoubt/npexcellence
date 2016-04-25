class Org < ActiveRecord::Base

  # constants
  ROLES  = ['funder', 'nonprofit']

  # configuration
  extend FriendlyId
  friendly_id :name, use: :slugged

  # mixins
  has_paper_trail
  include Roles

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :logo, styles: {
    tiny: '30x30#',
    icon: '50x50#',
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :photo, styles: {
    tiny: '30x30#',
    icon: '50x50#',
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_attached_file :photo_two, styles: {
    tiny: '30x30#',
    icon: '50x50#',
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_attached_file :photo_three, styles: {
    tiny: '30x30#',
    icon: '50x50#',
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  has_attached_file :photo_four, styles: {
    tiny: '30x30#',
    icon: '50x50#',
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }


  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  # associations
  has_many :users

  # validations
  validates_presence_of     :name
  validates_presence_of     :active

  #-------------------------------------------------------------------------------
  # Private Methods
  #-------------------------------------------------------------------------------
  private

  def ensure_role
    unless ROLES.include?(self.role)
      self.role = 'nonprofit'
    end
  end

end
