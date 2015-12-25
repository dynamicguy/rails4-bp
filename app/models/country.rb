# == Schema Information
#
# Table name: countries
#
#  code           :string           primary key
#  name           :string           not null
#  continent      :string           default("Asia"), not null
#  region         :string           default(""), not null
#  surfacearea    :integer
#  indepyear      :integer          default(0)
#  population     :integer          default(0), not null
#  lifeexpectancy :integer
#  gnp            :integer
#  gnpold         :integer
#  localname      :string           default(""), not null
#  governmentform :string           default(""), not null
#  headofstate    :string           default("")
#  capital        :integer          default(0)
#  code2          :string           default(""), not null
#

class Country < ActiveRecord::Base
  self.primary_key = 'code'
  resourcify
  self.per_page = 20
  #friendly_id :countrycode, :use => :slugged
  #friendly_id :code #, :use => :scoped, :scope => :countrylanguage

  has_many :cities
  belongs_to :countrylanguage

  def to_param
    "#{code}".parameterize
  end

  searchable :auto_index => true, :auto_remove => false do
    string :code
    text :name
    string :code
    string :continent
    string :region
    string :localname
    integer :population
  end

##
##def language_and_language
##  "#{language}-#{countrycode}"
##end
##
##def update_custom(id, params)
##  Countrylanguage.where(language: id.split('-').first, countrycode: id.split('-').last).first.update_attributes(params)
##end

#def self.find(id)
#  Country.where(code: id).first
#end
end
