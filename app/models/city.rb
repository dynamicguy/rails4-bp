class City < ActiveRecord::Base
  resourcify
  self.per_page = 20

  belongs_to :country

  searchable :auto_index => true, :auto_remove => false do
    text :name, :more_like_this => true
    string :name
    text :district
    integer :id
    integer :population

    string :sort_name do
      name.downcase.gsub(/^(an?|the)/, '')
    end
  end

end
