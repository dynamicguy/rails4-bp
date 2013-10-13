class Page < ActiveRecord::Base
  resourcify
  self.per_page = 20

  #acts_as_nested_set
  #include TheSortableTree::Scopes

  # RELATIONS
  belongs_to :user

  # VALIDATIONS
  validates :user, presence: true
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  searchable :auto_index => true, :auto_remove => false do
    integer :id
    string :title
    string :state
    text :content, :more_like_this => true
    time :updated_at
  end


  #state_machine :state, :initial => :draft do
  #  # events
  #  event :to_draft do
  #    transition all => :draft
  #  end
  #
  #  event :to_published do
  #    transition all => :published
  #  end
  #
  #  event :to_deleted do
  #    transition all => :deleted
  #  end
  #end
end
