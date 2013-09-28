class Article < ActiveRecord::Base
  resourcify
  self.per_page = 20

end
