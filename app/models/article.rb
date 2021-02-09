class Article < ApplicationRecord
  # corresponding to belongs_to in comments.rb - fetch array of all comments for @article using @article.comments
  include Visible
  # dependent destroy is a Rails feature which will destory all comments associated with the article if we delete the article - it's optional obviously
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
