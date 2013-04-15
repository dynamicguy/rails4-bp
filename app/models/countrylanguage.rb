class Countrylanguage < ActiveRecord::Base
  has_many :countries, :inverse_of => :countrylanguage
  paginates_per 50

  def id
    "#{language}-#{countrycode}"
  end

end
