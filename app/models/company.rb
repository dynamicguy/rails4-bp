class Company < ActiveRecord::Base
  resourcify
  self.per_page = 20
  validates :name, presence: true

  searchable :auto_index => true, :auto_remove => false do
    integer :id
    text :name, :more_like_this => true
    string :name
    string :website
    string :phone
    time :updated_at
  end

end
