class Countrylanguage < ActiveRecord::Base
  self.primary_key = ['language', 'countrycode']

  resourcify
  self.per_page = 20

  has_many :countries
  validates_presence_of :language, :slug

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
        :language,
        [:language, :countrycode]
    ]
  end

  searchable :auto_index => true, :auto_remove => false do
    text :slug
    string :language
    string :language
    string :countrycode
    boolean :isofficial
    integer :percentage
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
