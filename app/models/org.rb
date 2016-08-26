class Org < ActiveRecord::Base

  # constants
  ROLES  = ['funder', 'nonprofit']

  # configuration
  extend FriendlyId
  friendly_id :name, use: :slugged

  # mixins
  has_paper_trail
  include Roles
  include Roo

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
  has_attached_file :staff_photo, styles: {
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
  # Class Methods
  #-------------------------------------------------------------------------------

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header      = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|

      row = Hash[[header, spreadsheet.row(i)].transpose]
      org = find_by_name(row["Agency Name"]) || new

      # org.attributes = row.to_hash.slice(*accessible_attributes)

      org.name         = row["Agency Name"]
      org.address      = row["Address 1"]
      org.phone        = row["Main Phone"]
      org.city         = row["Address 1: City"]
      org.contact      = row["Primary Contact"]
      org.email        = row["Email (Primary Contact) (Contact)"]
      org.website      = row["Website"]
      org.org_type     = row["Organization Type"]
      org.abbreviation = row["Agency Abbreviation"]
      org.role         = 'nonprofit'
      org.active       = true
      org.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then CSV.new(file.path)
    when ".xls" then Excel.new(file.path)
    when ".xlsx" then Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

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
