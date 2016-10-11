class Setting < ActiveRecord::Base
  # mixins
  has_paper_trail


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
  has_attached_file :banner, styles: {
    small:  '384x216',
    square: '300x300#',
    medium: '768x432',
    full:   '1920x1080'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/


  # validations
  # validates :wp_max_variation_percent, inclusion: { in: (0.0..10.0), message: 'must be between 0.0% and 10%.' }


  #-------------------------------------------------------------------------------
  # Public Class Methods
  #-------------------------------------------------------------------------------

  def self.instance
    first_or_create!
  end

  #-------------------------------------------------------------------------------
  # Public Instance Methods
  #-------------------------------------------------------------------------------

  
end