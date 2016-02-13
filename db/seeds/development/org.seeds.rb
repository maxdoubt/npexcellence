# define user attributes
orgs = [
  { name: 'Test Nonprofit', role: 'nonprofit',  active: true, phone: '9011231234', address: '123 Test Address', contact: 'John Doe', email: 'john@doe.com', website: 'testnonprofit.org', description: 'Test Org', funding: 'no funding'},
  { name: 'Test Funder',    role: 'funder',     active: true, phone: '9011231234', address: '123 Test Address', contact: 'John Doe', email: 'john@doe.com', website: 'testnonprofit.org', description: 'Test Org', funding: 'no funding'},

]

# idempotently add orgs
orgs.each do |attrs|
  name        = attrs[:name]
  role        = attrs[:role]
  active      = attrs[:active]
  phone       = attrs[:phone]
  address     = attrs[:address]
  contact     = attrs[:contact]
  email       = attrs[:email]
  website     = attrs[:website]
  description = attrs[:description]
  funding     = attrs[:funding]


  unless o = Org.where(name: name).exists?
    o             = Org.new
    o.name        = name
    o.role        = role
    o.active      = active
    o.phone       = phone
    o.address     = address
    o.contact     = contact
    o.email       = email
    o.website     = website
    o.description = description
    o.funding     = funding
    o.save!
  end
end

# report status
puts "***** seed orgs (#{ Org.count }) ***************"
