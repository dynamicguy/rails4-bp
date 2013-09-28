class City < ActiveRecord::Base
  resourcify
  self.per_page = 20

  belongs_to :country
end
