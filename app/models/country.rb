class Country < ActiveRecord::Base
  extend FriendlyId
  friendly_id :code, use: :slugged

  has_many :cities
  belongs_to :countrylanguage, :inverse_of => :countries
  paginates_per 20

  def to_param
  "#{code}".parameterize
  end
##
##def language_and_language
##  "#{language}-#{countrycode}"
##end
##
##def update_custom(id, params)
##  Countrylanguage.where(language: id.split('-').first, countrycode: id.split('-').last).first.update_attributes(params)
##end

  def self.find(id)
    Country.where(code: id).first
  end
end
