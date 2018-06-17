class Batch < ApplicationRecord
  belongs_to :aylien_category
  has_many :aylien_article_user_batches, dependent: :destroy
  has_many :users, through: :aylien_article_user_batches
  has_many :aylien_article_batches, dependent: :destroy
  has_many :aylien_articles, through: :aylien_article_batches
end
