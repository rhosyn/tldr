class AylienArticleBatch < ApplicationRecord
  belongs_to :aylien_article, dependent: :destroy
  belongs_to :batch, dependent: :destroy
  has_many :aylien_article_user_batches, through: :batches
  has_many :users, through: :aylien_article_user_batches
end
