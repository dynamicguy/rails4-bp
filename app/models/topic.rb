class Topic < ActiveRecord::Base
  self.primary_key = 'topic_id'
  self.table_name = 'topic'

  resourcify
  self.per_page = 20
  validates :topic_title, presence: true

  searchable :auto_index => true, :auto_remove => false do
    integer :topic_id

    text :topic_title, :more_like_this => true
    text :topic_content, :more_like_this => true
    text :toc_name, :more_like_this => true

    string :keywords, :multiple => true

    string :topic_type
    string :index_name
    string :topic_permalink
    string :topic_content
    integer :prj_id
    integer :comp_id
    boolean :inc_search

    boolean :topic_status
    boolean :deleted
    boolean :toc_hidden
  end


end
