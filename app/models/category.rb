# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  title        :string
#  content      :text
#  secret_field :text
#  parent_id    :integer
#  lft          :integer
#  rgt          :integer
#  depth        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Category < ActiveRecord::Base
  resourcify
  self.per_page = 20

  acts_as_nested_set
  include TheSortableTree::Scopes

end
