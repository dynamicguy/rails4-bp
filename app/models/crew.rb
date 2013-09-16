class Crew < ActiveRecord::Base
  paginates_per 10
  validates_presence_of :name
end
