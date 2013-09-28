class Category < ActiveRecord::Base
  resourcify
  self.per_page = 20

  acts_as_nested_set
  include TheSortableTree::Scopes

end
