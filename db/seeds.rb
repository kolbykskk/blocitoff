# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  user = User.new
  pw = FFaker::Internet.password

  user.email = FFaker::Internet.email
  user.password = pw
  user.password_confirmation = pw

  user.skip_confirmation!
  user.save!
end

# Create my test user
  user = User.new
  pw = "password"

  user.email = "kolbykalafut@gmail.com"
  user.password = pw
  user.password_confirmation = pw

  user.skip_confirmation!
  user.save!

  users = User.all

50.times do
 item = Item.new
 item.name = FFaker::Lorem.sentence
 item.user = users.sample

 item.save!
end
