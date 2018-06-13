class AylienKeyword < ApplicationRecord
  has_many :aylien_article_keywords, dependent: :destroy
  has_many :aylien_articles, through: :aylien_article_keywords
end
