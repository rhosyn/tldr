class ArticleHashtag < ApplicationRecord
  belongs_to :hashtag
  belongs_to :aylien_source
end
