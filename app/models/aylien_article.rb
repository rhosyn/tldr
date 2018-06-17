class AylienArticle < ApplicationRecord
  belongs_to :aylien_source
  has_many :aylien_article_keywords, dependent: :destroy
  has_many :aylien_keywords, through: :aylien_article_keywords
  has_many :article_hashtags, dependent: :destroy
  has_many :aylien_hashtags, through: :article_hashtags
  has_many :article_categories, dependent: :destroy
  has_many :aylien_categories, through: :article_categories

  has_many :aylien_article_batches
  has_many :batches, through: :aylien_article_batches
  has_many :aylien_article_user_batches, through: :batches
  has_many :users, through: :aylien_article_user_batches
  validates :article_url, uniqueness: true, presence: true
end
