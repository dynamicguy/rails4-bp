require 'ffaker'

Company.delete_all

100.times do |i|
  var = Company.new
  var.comp_name = Faker::Name.name
  var.website = Faker::Internet.http_url
  var.phone = Faker::PhoneNumber.phone_number
  var.created_time = Time.now
  var.modified_time = Time.now
  var.created_uid = SecureRandom.hex(10)
  var.modified_uid = SecureRandom.hex(10)
  var.save
end
