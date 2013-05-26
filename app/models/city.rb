class City < ActiveRecord::Base
  belongs_to :country
  paginates_per 50
end
