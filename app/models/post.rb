class Post < ApplicationRecord
	has_many :comments

	validates :title, presence: true
  validates :post, presence: true, length: { minimum: 10 }
end
