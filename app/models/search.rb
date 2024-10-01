class Search < ApplicationRecord
   def self.search(keyword)
    where("title LIKE ?", "%#{keyword}%")
   end
end
