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
