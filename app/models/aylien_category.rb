class AylienCategory < ApplicationRecord
  has_many :article_categories, dependent: :destroy
  has_many :aylien_articles, through: :article_categories
  has_many :batches
end
