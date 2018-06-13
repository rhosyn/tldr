class ArticleCategory < ApplicationRecord
  belongs_to :aylien_category
  belongs_to :aylien_article
end
