class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :code, use: :slugged

  has_many :cities
  belongs_to :countrylanguage, :inverse_of => :countries
  paginates_per 20

end
