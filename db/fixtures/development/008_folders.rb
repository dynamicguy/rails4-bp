require 'ffaker'

Folder.delete_all

100.times do |i|
  var = Folder.new
  var.name = Faker::Name.name
  var.link_url = Faker::Internet.http_url
  var.save
end
