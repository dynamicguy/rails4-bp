class Topic < ActiveRecord::Base
  self.primary_key = 'topic_id'
  self.table_name = 'topic'

  resourcify
  self.per_page = 20
  validates :topic_title, presence: true

  searchable :auto_index => true, :auto_remove => false do
    integer :topic_id
    text :topic_title, :more_like_this => true
    string :topic_title
    string :toc_name
    string :index_name
    string :topic_permalink
  end


end
