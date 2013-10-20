#require 'ffaker'
#
#Project.delete_all
#
#100.times do |i|
#  var = Project.new
#  var.name = Faker::Name.name
#  var.domain = Faker::Internet.domain_name
#  var.site_address = Faker::Internet.http_url
#  var.phone_home = Faker::PhoneNumber.phone_number
#  var.theme = Faker::Internet.user_name
#  var.token = Faker::Internet.user_name
#  var.save
#end
