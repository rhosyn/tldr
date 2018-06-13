class ArticleHashtag < ApplicationRecord
  belongs_to :aylien_hashtag
  belongs_to :aylien_article
end
