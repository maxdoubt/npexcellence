# define user attributes
users = [
  { first_name: 'Admin',    last_name: 'User', email: 'admin@example.com', role: 'admin' },
  { first_name: 'Normal',   last_name: 'User', email: 'user@example.com',  role: 'user' },
  { first_name: 'Normal 2', last_name: 'User', email: 'user2@example.com', role: 'user' }
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
