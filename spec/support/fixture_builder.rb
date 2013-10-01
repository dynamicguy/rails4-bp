require File.join(File.dirname(__FILE__), "user_methods.rb")

FixtureBuilder.configure do |fbuilder|

  # rebuild fixtures automatically when these files change:
  fbuilder.files_to_check += Dir["app/models/*.rb", "lib/**/*.rb",  "spec/factories/*.rb", "spec/support/fixture_builder.rb"]

  # now declare objects
  fbuilder.factory do
    # Users
   end
end