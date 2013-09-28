class Crew < ActiveRecord::Base
  resourcify
  self.per_page = 20

  validates_presence_of :name
end
