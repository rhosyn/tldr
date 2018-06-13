class AylienArticle < ApplicationRecord
  belongs_to :aylien_source
  has_many :aylien_article_keywords, dependent: :destroy
  has_many :aylien_keywords, through: :aylien_article_keywords
end
