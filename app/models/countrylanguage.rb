class Countrylanguage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :language_and_language

  def language_and_language
    "#{language}-#{countrycode}"
  end

  has_many :countries
  paginates_per 50

  def to_param
    "#{language} #{countrycode}".parameterize
  end
  ##
  ##def language_and_language
  ##  "#{language}-#{countrycode}"
  ##end
  ##
  ##def update_custom(id, params)
  ##  Countrylanguage.where(language: id.split('-').first, countrycode: id.split('-').last).first.update_attributes(params)
  ##end
  ##
  def self.find(id)
    Countrylanguage.where(language: id.split('-').first, countrycode: id.split('-').last).first
  end

end
