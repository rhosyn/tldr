class AylienArticle < ApplicationRecord
  belongs_to :aylien_source
  has_many :aylien_article_keywords, dependent: :destroy
  has_many :aylien_keywords, through: :aylien_article_keywords
  has_many :aylien_article_hashtags, dependent: :destroy
  has_many :aylien_hashtags, through: :aylien_article_hashtags
  has_many :aylien_article_categories, dependent: :destroy
  has_many :aylien_categories, through: :aylien_article_categories
end
