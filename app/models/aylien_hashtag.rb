class AylienHashtag < ApplicationRecord
  has_many :article_hashtags, dependent: :destroy
  has_many :aylien_articles, through: :article_hashtags
end
