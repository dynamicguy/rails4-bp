class Project < ActiveRecord::Base
  self.primary_key = 'prj_id'
  self.table_name = 'project'

  resourcify
  self.per_page = 20
  validates :prj_name, presence: true
  
  searchable :auto_index => true, :auto_remove => false do
    integer :prj_id
    text :prj_name, :more_like_this => true
    string :prj_name
    string :site_address
    string :theme
  end
  
end
