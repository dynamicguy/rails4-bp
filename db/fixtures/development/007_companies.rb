require 'ffaker'

Company.delete_all

100.times do |i|
  var = Company.new
  var.name = Faker::Name.name
  var.website = Faker::Internet.http_url
  var.phone = Faker::PhoneNumber.phone_number
  var.save
end
