# prerequisite seeds
after "development:user" do

  # define user attributes
  posts = (1..10).map { |i|
    { 
      title:                FFaker::Lorem.sentence,
      abstract:             FFaker::Lorem.paragraph,
      body:                 FFaker::Lorem.paragraphs,
      user:                 User.all.first,
      published:            true
    }
  }

  # idempotently add orgs
  posts.each do |t|
    Post.create!(t)
  end

  # report status
  puts "***** seed posts (#{ Post.count }) ***************"

end