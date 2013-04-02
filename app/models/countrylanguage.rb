class Countrylanguage < ActiveRecord::Base
  has_many :countries
  paginates_per 50
end
