class Book < ApplicationRecord
  belongs_to :user
 # belongs_to :genre
  has_many :book_tags,dependent: :destroy
  has_many :tags,through: :book_tags
  def self.search(keyword)
    where("title LIKE ?", "%#{keyword}%")
  end
end
