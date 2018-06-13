class AylienCategory < ApplicationRecord
  has_many :aylien_article_categories, dependent: :destroy
  has_many :aylien_articles, through: :aylien_article_categories
end
