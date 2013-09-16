require 'ffaker'

Crew.delete_all

100.times do |i|
  var = Crew.new
  var.title = Faker::Name.name
  var.name = Faker::Name.name
  var.species = Faker::Name.name
  var.origin = Faker::Address.city
  var.quote = Faker::Lorem.sentence(1)
  var.age = Faker::PhoneNumber.phone_number
  var.avatar = 'default_avatar.png'
  var.save
end