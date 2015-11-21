require 'faker'

## Create new users
5.times do
  user = User.new(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(10)
  )
  # user.skip_confirmation!
  user.save
end

randy = User.new(
name: 'Randy Richards',
email: 'rdj7890@outlook.com',
password: 'january99',
role: 'admin'
)
# randy.skip_confirmation!
randy.save

users = User.all
puts "#{User.count} users created."

20.times do
  wiki = Wiki.create!(
  user: users.sample,
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph
  )
end

wikis = Wiki.all
puts "#{wikis.count} wikis created."
