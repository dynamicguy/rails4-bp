class Page < ActiveRecord::Base
  acts_as_nested_set
  include TheSortableTree::Scopes
  paginates_per 10

end
