class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify

  def self.with_name(name)
    find_by :name => name
  end


end