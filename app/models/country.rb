class Country < ActiveRecord::Base
  has_many :cities
  belongs_to :countrylanguage, :inverse_of => :countries
  paginates_per 20

end
