class AylienArticleUserBatch < ApplicationRecord
  belongs_to :batch, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
