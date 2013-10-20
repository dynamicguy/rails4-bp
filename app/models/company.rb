class Company < ActiveRecord::Base
  self.primary_key = 'comp_id'
  self.table_name = 'company'

  resourcify
  self.per_page = 20
  validates :comp_name, presence: true

  searchable :auto_index => true, :auto_remove => false do
    integer :comp_id
    text :comp_name, :more_like_this => true
    string :comp_name
    string :website
    string :phone
  end

end
