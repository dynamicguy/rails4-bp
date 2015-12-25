# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string(35)       default(""), not null
#  countrycode :string(3)        default(""), not null
#  district    :string(20)       default(""), not null
#  population  :integer          default(0), not null
#
# Indexes
#
#  countrycode  (countrycode)
#

class City < ActiveRecord::Base
  resourcify
  self.per_page = 20
  validates :name, presence: true
  belongs_to :country

  searchable :auto_index => true, :auto_remove => false do
    text :name, :more_like_this => true
    string :name
    string :district
    string :countrycode
    text :district
    integer :id
    integer :population
  end

end
