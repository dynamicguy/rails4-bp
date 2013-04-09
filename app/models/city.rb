class City < ActiveRecord::Base
  belongs_to :country
  belongs_to :countrylanguage
  paginates_per 50
end
