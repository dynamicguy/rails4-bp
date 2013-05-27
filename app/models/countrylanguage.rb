class Countrylanguage < ActiveRecord::Base
  extend FriendlyId

  has_many :countries
  paginates_per 50

  friendly_id :slug_candidates, use: :slugged

  # Try building a slug based on the following fields in
  # increasing order of specificity.
  def slug_candidates
    [:language, :countrycode]
  end
  #
  #def language_and_language
  #  "#{language}-#{countrycode}"
  #end
  #
  #def to_param
  #  "#{language} #{countrycode}".parameterize
  #end
  #
  ###
  ###def language_and_language
  ###  "#{language}-#{countrycode}"
  ###end
  #
  #def self.update_custom(countrylanguage, params)
  #  countrylanguage.update_attributes(params)
  #  #Countrylanguage.where(language: countrylanguage.language, countrycode: countrylanguage.countrycode).first.update_attributes(params)
  #end
  #
  #def self.find(id)
  #  Countrylanguage.where(language: id.split('-').first, countrycode: id.split('-').last).first
  #end

end
