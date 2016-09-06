# prerequisite seeds
after "development:training_category" do

  # define user attributes
  trainings = (1..10).map { |i|
    { 
      name:                 FFaker::Conference.name,
      location:             FFaker::AddressUS.street_address,
      slug:                 FFaker::Conference.name.downcase.gsub!(/ /, '-'),
      description:          FFaker::Lorem.paragraph,
      facilitators:         FFaker::Name.name,
      begin_date:           FFaker::Time.date,
      end_date:             FFaker::Time.date,
      max_registrations:    50,
      active:               true,
      featured:             false,
      fee:                  20.15,
      training_category_id: 3
    }
  }

  # idempotently add orgs
  trainings.each do |t|
    Training.create!(t)
  end

  # report status
  puts "***** seed trainings (#{ Training.count }) ***************"

end
