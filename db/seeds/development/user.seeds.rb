# prerequisite seeds
after "development:org" do

  # define user attributes
  users = [
    { first_name: 'Admin',      last_name: 'User', email: 'admin@example.com',      role: 'admin' },
    { first_name: 'Employee',   last_name: 'User', email: 'employee@example.com',   role: 'employee' },
    { first_name: 'Org Admin',  last_name: 'User', email: 'org_admin@example.com',  role: 'org_admin',  org_id: 1 },
    { first_name: 'Member',     last_name: 'User', email: 'member@example.com',     role: 'member',     org_id: 1 }
  ]

  # idempotently add users
  users.each do |attrs|
    name        = attrs[:name]
    first_name  = attrs[:first_name]
    last_name   = attrs[:last_name]
    email       = attrs[:email]
    role        = attrs[:role]

    unless u = User.where(email: email).exists?
      u                       = User.new
      u.first_name            = first_name
      u.last_name             = last_name
      u.email                 = email
      u.role                  = role
      u.password              = 'Password123'
      u.password_confirmation = 'Password123'
      u.save!
    end
  end


  # report status
  puts "***** seed users (#{ User.count }) ***************"

end