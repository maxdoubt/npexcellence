class Listing < ActiveRecord::Base

  # mixins
  include AASM
  include Roo
  include ArelHelpers::ArelTable

  # assocations
  belongs_to    :org
  belongs_to    :user

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

  # ----------------------------------------

  has_attached_file :upload
  validates_attachment_content_type :upload, :content_type => [
    "application/pdf",
    "application/vnd.ms-excel",     
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/msword", 
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    "text/plain"]

  #-------------------------------------------------------------------------------
  # Class Methods
  #-------------------------------------------------------------------------------

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header      = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|

      row     = Hash[[header, spreadsheet.row(i)].transpose]
      listing = new

      listing.org_name         = row["Organization"]
      listing.title            = row["Job Title"]
      listing.date_posted      = DateTime.strptime(row["Date Posted"], '%m/%d/%Y')
      listing.description      = row["Description"]
      listing.responsibilities = row["Responsibilities "]
      listing.qualifications   = row["Qualifications"]
      listing.instructions     = row["How to Apply"]
      listing.state            = 'new'
      listing.save!
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

end