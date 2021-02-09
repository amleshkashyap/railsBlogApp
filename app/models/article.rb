class Article < ApplicationRecord
  # corresponding to belongs_to in comments.rb - fetch array of all comments for @article using @article.comments
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
