class AylienHashtag < ApplicationRecord
  has_many :aylien_article_hashtags, dependent: :destroy
  has_many :aylien_articles, through: :aylien_article_hashtags
end
