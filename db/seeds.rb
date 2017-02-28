# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

268.times do |i|
  Park.create!(name: Faker::Name.name,
               floor: 1,
               number: i + 1,
               phone: "09#{Faker::PhoneNumber.subscriber_number(8)}")
end
