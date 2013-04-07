class Country < ActiveRecord::Base
  has_many :cities, through: :code
  belongs_to :countrylanguage
  paginates_per 20
end
